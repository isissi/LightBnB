const properties = require('./json/properties.json');
const users = require('./json/users.json');

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb', 
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  const queryString = `SELECT * FROM users WHERE email = $1;`;

  return pool
  .query(queryString, [email])
  .then(res => {
    if (res.rows.length === 0) {
      return null
    } else {
      return res.rows[0];
    }
  }).catch(err => console.error('query error', err.stack));
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  const queryString = `SELECT * FROM users WHERE id = $1;`;

  return pool
  .query(queryString, [id])
  .then(res => {
    if (res.rows.length === 0) {
      return null
    } else {
      return res.rows[0];
    }
  }).catch(err => console.error('query error', err.stack));
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  const value = [user.name, user.password, user.email];
  const queryString = `INSERT INTO users (name, email, password) VALUES ($1, $3, $2) RETURNING *;`;

  return pool
  .query(queryString, value)
  .then(res => {
    return res.rows[0];
  }).catch(err => console.error('query error', err.stack));
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  // return getAllProperties(null, 2);
  const value = [guest_id, limit];
  const queryString = `SELECT reservations.*, properties.*, avg(rating) as average_rating
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON properties.id = property_reviews.property_id
  WHERE reservations.guest_id = $1
  GROUP BY properties.id, reservations.id
  ORDER BY reservations.start_date
  LIMIT $2;`;
  
  return pool
  .query(queryString, value)
  .then(res => {
    return res.rows;
  })

}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  let value = [];
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON property_reviews.property_id = properties.id
  WHERE TRUE `;

  if (options.city) {
    value.push(`%${options.city}%`)
    queryString += ` AND properties.city LIKE $${value.length}`;
  }

  if (options.owner_id ){
    value.push(options.owner_id);
    queryString += ` AND properties.owner_id = $${value.length}`;
  } 

  if (options.minimum_price_per_night) {
    value.push(options.minimum_price_per_night * 100);
    queryString += ` AND properties.cost_per_night > $${value.length}`;
  } 

  if (options.maximum_price_per_night) {
    value.push(options.maximum_price_per_night * 100);
    queryString += ` AND properties.cost_per_night < $${value.length}`;
  } 


  queryString += `
  GROUP BY properties.id`;

  if (options.minimum_rating) {
    value.push(options.minimum_rating);
    queryString += ` HAVING avg(property_reviews.rating) >= $${value.length}`;
  } 

  value.push(limit);
  queryString += `
  ORDER BY properties.cost_per_night
  LIMIT $${value.length};
  `;

  return pool
    .query(queryString, value)
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  // const propertyId = Object.keys(properties).length + 1;
  // property.id = propertyId;
  // properties[propertyId] = property;
  // return Promise.resolve(property);

  const value = [property.owner_id, property.title, property.description, property.thumbnail_photo_url, property.cover_photo_url, property.cost_per_night, property.parking_spaces, property.number_of_bathrooms, property.number_of_bedrooms, property.country, property.street, property.city, property.province, property.post_code];
  const queryString = `
    INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, 
    cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, 
    city, province, post_code)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
    RETURNING *
    `;

    return pool
    .query(queryString, value)
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
}
exports.addProperty = addProperty;
