const { Sequelize } = require('sequelize');

// Konfigurasi koneksi Sequelize
const sequelize = new Sequelize('db_uasdpsi7', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
});

const User = require('./user')(sequelize);
const Complaint = require('./complaint')(sequelize);
const Response = require('./response')(sequelize);

// Define associations
Complaint.belongsTo(User, { foreignKey: 'studentId', as: 'student' });
Complaint.belongsTo(User, { foreignKey: 'staffId', as: 'staff' });

Response.belongsTo(Complaint, { foreignKey: 'complaintId', as: 'complaint' });
Response.belongsTo(User, { foreignKey: 'staffId', as: 'staff' });

Complaint.hasOne(Response, { foreignKey: 'complaintId', as: 'response' });

// Sinkronkan model dengan database
sequelize.sync()
  .then(() => {
    console.log('Database synchronized');
  })
  .catch(err => {
    console.error('Error synchronizing database:', err);
  });

module.exports = {
    sequelize,
    User,
    Complaint,
    Response
};
