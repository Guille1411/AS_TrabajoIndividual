var config = require('./config.json');
var r = require('rethinkdb');

r.connect(config.rethinkdb)
.then(function(conn) {
    console.log("Espera de 5 segundos");
    setTimeout(function(){
        console.log("Fin de la espera");
        console.log("CONECTADO a RethinkDB");
        r.tableCreate('users').run(conn)
        .then(console.log("     Tabla creada"))
        .error(function(error){});
        console.log("DESCONECTADO de RethinkDB")
        conn.close(function(err) { if (err) throw err; });
    }, 5000);
    
})
.error(function(error) {
    console.log(error.message);
});