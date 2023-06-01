const device = require('../models/device.model');

exports.getAllById = async (req, res) => {
  const result = await device.find({ id: req.id });;

  return res.send(result);
};

  exports.getValueByIndicatorLast = async (req, res) => {
    const results = await device.find({ meteorological_indicator: 'Temperature Degree Centigrade (°C)' });
    const value = results[4].value;
    res.send(`${value}` + '   C°') ;


    };

exports.getValueByIndicatorLast1 = async (req, res) => {
  const results1 = await device.find({ meteorological_indicator: 'Gas m3' });
  const value1 = results1[5].value;
  res.send(`${value1}` + '   m3') ;
  


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
          console.log(values);
          res.send(`${values}`) ;  
          
          };
    
    