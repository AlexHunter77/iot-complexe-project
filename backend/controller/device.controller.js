const device = require('../models/device.model');

exports.getAllById = async (req, res) => {
  const result = await device.find({ id: req.id });;

  return res.send(result);
};

exports.getValueByIndicatorLast = async (req, res) => {
  const results = await device.find({ meteorological_indicator: 'Temperature Degree Centigrade (°C)' });
  const values = results.map(result => result.value);
  //res.send(`${values}`);
 /* const min = 19.0;
const max = 27.0;
const random = Math.random();
const newValue = random * (max - min) + min;*/
const randomIndex = Math.floor(Math.random() * values.length);
const newValue = values[randomIndex];
  res.send(`${newValue}`+ '   C°');
};

exports.getValueByIndicatorLast1 = async (req, res) => {
  const results1 = await device.find({ meteorological_indicator: 'Gas m3' });
  const value1 = results1.map(result => result.value);

  const randomIndex = Math.floor(Math.random() * value1.length);
  const newValue = value1[randomIndex];
  res.send(`${newValue}` + '   m3') ;
  


  };

  exports.getValueByIndicatorLast2 = async (req, res) => {
    const results2= await device.find({ meteorological_indicator: 'Water L' });
    const values2 = results2[3].value;
    res.send(`${values2}` + '   Liter') ;
    
  
  
    };
    
    exports.getValueByIndicatorLast3 = async (req, res) => {
      const results = await device.find({ meteorological_indicator: 'Power  kWh' });
      const value3 = results[2].value;
      res.send(`${value3}` + '   kWh') ;
  
    
      };

      exports.getValueByIndicatorLast4 = async (req, res) => {
        const results = await device.find({ meteorological_indicator: 'Level' });
        const values = results[2].value;
        
        res.send(`${values}`) ;    
           
        };
  
        exports.getValueByIndicatorLast5 = async (req, res) => {
          const results = await device.find({ meteorological_indicator: 'Level11' });
          const values = results[1].value;
          res.send(`${values}`) ;  
          
          };
    
    