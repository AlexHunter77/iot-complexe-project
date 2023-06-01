const express = require ('express');
// const User = require ('../models/user.model');
const router = express.Router();
const UserController = require('../controller/user.controller');
const DeviceController = require('../controller/device.controller')
// const device = require('../models/device.model');


router.post('/signin',UserController.login);

//temp
router.get('/temp', DeviceController.getValueByIndicatorLast);
//gas
router.get('/gas', DeviceController.getValueByIndicatorLast1);
//water
router.get('/water', DeviceController.getValueByIndicatorLast2);
//energy
router.get('/energy', DeviceController.getValueByIndicatorLast3);
//Level
router.get('/level', DeviceController.getValueByIndicatorLast4);
//Level1
router.get('/level1', DeviceController.getValueByIndicatorLast5);
module.exports = router;

