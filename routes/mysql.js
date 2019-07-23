/******************************************************** 
    Mysql Router
*********************************************************
    Andres Vicente Caballero Cantillo
    Alex erne
    Projet Transversal I
    Group 5 - Système de recommendation	de produits
**********************************************************/

const mysql = require('mysql');
var constants = require('./mysqlRequete');
var fs = require('fs');
var gutil = require('gulp-util');

/*------------------------------------------------
 |           MySQL CONFIG CONNECTION             |
 ------------------------------------------------*/
let connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "andres",
    password: "Hipermaga66*",
    database: "easty"
});

connection.connect((err)=>{ 
    err ? console.log(gutil.colors.red(`problème de connection avec la base des données`)): 
            console.log(gutil.colors.magenta(`Connecté à la base des données`));
});


const routerMysql = (app, sessionStore)=>{

    /*-------------------------------------------------
    |             System Fonction Aide                |
    --------------------------------------------------*/

    userAction = (surname, action, value) =>{
        let sqlQuery = constants.USER_ACTION(surname, action, value)
        connection.query(sqlQuery, (err, resultat) => {
            err ? console.log(gutil.colors.red(err)) : console.log(gutil.colors.cyan(surname, action, value))
        }) 
    }

    userSession = (req, res, callBack) => {
        let sid = req.body.id
        sessionStore.get(sid, (err, session)=>{
            err ? res.json({ok:false, err:err}) : (
                session ? (
                    session.cookie.expires = new Date(Date.now() + (60 * 1000 * 60)),
                    callBack(session)
                ):(
                    console.log(gutil.colors.red('session off detected')),
                    res.json({ok:false, msg:'il faut faire login avant :(', err:1})
                )

            )
        })
    }

    deleteUser = (surname) =>{
        connection.query(`DELETE FROM users WHERE surname = '${surname}'`, (err, resultat) => {
            if(err) throw err 
        })
    }

    isDisponible = (req, callback) =>{
        let sqlQuery = constants.FIND_SIMPLE_USER(req.body.surname)
        connection.query(sqlQuery, (err, resultat) => {
            err ? callback( false ) : callback( resultat[0] ? false : true )
        })
    }

    newUser = (req, callback) =>{
        let sqlQuery = constants.NEW_USER(req.body.surname, req.body.password, req.body.email)
        isDisponible(req,(solve)=>{
            solve ? (
                connection.query(sqlQuery, (err, resultat) => {
                    err ? (console.log(err),callback(2)) : callback(3)
                })
            ):callback(1)
        })
    }

    newAcheteur = (req, res) =>{
        newUser(req, (solve)=>{
            switch (solve) {
                case 1:                    
                    res.json({ ok: false, msg:`Surnom: ${req.body.surname} ne pas disponible`})
                    break;
                case 2:
                    res.json({ ok: false, msg:'error creando user'})
                    break;
                case 3:
                    let sqlQuery = constants.NEW_ACHETEUR(req.body.surname, req.body.password, req.body.quartier)
                    connection.query(sqlQuery, (err, resultat) => {
                        err ? (
                            deleteUser(req.body.surname),
                            console.log(gutil.colors.red(err)),
                            res.json({ ok: false, tp:3, msg:err })
                        ) : (
                            userAction(req.body.surname, 'CREATE', 'ACHETEUR'),
                            res.json({ ok: true, tp:3, msg:'succes'})
                        )
                    })
                    break;
                default:
                    res.json({ ok: true, msg:'error inconue'})
                    break;
            }
        })
    }

    newVendeur = (req, res) =>{
        newUser(req, (solve)=>{
            switch (solve) {
                case 1:                    
                    res.json({ ok: false, msg:`Surnom: ${req.body.surname} ne pas disponible`})
                    break;
                case 2:
                    res.json({ ok: false, msg:'error creando user'})
                    break;
                case 3:
                    let sqlQuery = constants.NEW_VENDEUR(req.body.surname, req.body.password, req.body.nom, req.body.prenom, req.body.adresse, req.body.bancaire)
                    connection.query(sqlQuery, (err, resultat) => {
                        err ? (
                            deleteUser(req.body.surname),
                            console.log(gutil.colors.red(err)),
                            res.json({ ok: false, tp:3, msg:err })
                        ) : (
                            userAction(req.body.surname, 'CREATE', 'ACHETEUR'),
                            res.json({ ok: true, tp:3, msg:'succes'})
                        )
                    })
                    break;
                default:
                    res.json({ ok: true, msg:'error inconue'})
                    break;
            }
        })
    }

    deleteFile=(nom)=>{   
        fs.unlink(`./public/images/${nom}`, function(err) {
            if(err && err.code == 'ENOENT') {
                // file doens't exist
                console.log(gutil.colors.red("File doesn't exist, won't remove it.",err ));
            } else if (err) {
                // other errors, e.g. maybe we don't have enough permission
                console.log(gutil.colors.red("Error occurred while trying to remove file"));
            } else {
                console.log(gutil.colors.green(`file ${nom}removed`));
            }
        });
    }

    /*---------------------
    |        SI           |
    ---------------------*/

    /* fn 3	 Liste des utilisateurs
        LIST_USERS */
    app.post('/listUsers', (req, res) => {
        let sqlQuery = constants.LIST_USERS
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })

    /* fn 4	 Liste des acheteurs
        LIST_ACHETEURS */
    app.post('/listAcheteurs', (req, res) => {
        let sqlQuery = constants.LIST_ACHETEURS
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })

    /* fn 5	 Liste des vendeurs
        LIST_VENDEURS */
    app.post('/listVendeurs', (req, res) => {
        let sqlQuery = constants.LIST_VENDEURS
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })

    /* fn 7	 Liste des restaurants
        LIST_RESTAURANTS */
    app.post('/listRestaurants', (req, res) => {
        let sqlQuery = constants.LIST_RESTAURANTS
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, resultat })
        })
    })

    /* fn 8	 Liste des catégories
        LIST_CATEGORIES */
    app.post('/listCategories', (req, res) => {
        let sqlQuery = constants.LIST_CATEGORIES
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json(resultat)
        })
    })

    /* fn 9	 Liste des plats
        LIST_PLATS */
    app.post('/listProduits', (req, res) => {
        let sqlQuery = constants.LIST_PRODUITS
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })

    /*---------------------
    |       USER         |
    ---------------------*/

    /* fn 11 add un nouveau acheteur
        NEW_ACHETEUR(surname, password, quartier) */
    app.post('/newAcheteur', (req, res) => {
        newAcheteur(req, res)        
    })

    /* fn 12 add un nouveau vendeur
        NEW_VENDEUR(surname, password, nom, prénom, adresse, quartier, bancaire, comptePay, adresse) */
    app.post('/newVendeur', (req, res) => {
        newVendeur(req, res)
    })

    //function pour aider fn 13 LOGIN
    login = (resultat,req)=>{
        let status = resultat == '' ? (
            {ok:false, resultat:'user ou mot de passe incorrecte'}
        ):(
            req.session.surname = resultat[0].surname,
            req.session.password = req.body.password,
            req.session.typeuser = resultat[0].typeuser,
            req.session.sessID = req.session.id,
            userAction(req.session.surname, 'LOGIN', req.body.password), //(surname, action, value)
            { ok: true, surname: req.session.surname, typeUser:  req.session.typeuser, sessID: req.sessionID}
        )
        return status 
    }

    /* fn 13 demande de login
        LOGIN(surname, password) */
    app.post('/userLogin', (req, res)=> {
        let surname = req.body.surname ? req.body.surname : ''
        let password = req.body.password ? req.body.password : ''
        let sqlQuery = constants.FIND_USER(surname, password)
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) :
                res.json(login(resultat, req))
        })
    });

    /* fn 14 demande de logout
        LOGOUT(surname, password) */
    app.post('/userLogout', (req, res) => {
        userSession(req, res, (session)=>{
            let ok = session ? (
                sessionStore.destroy(req.body.id, (err)=>{
                    err? console.log(gutil.colors.red(err)) : userAction(session.surname, 'LOGOUT', '')
                }),
                true
            ):false
            res.json({ok:ok})           
        })
    })

    /* fn 15 fournir action de session
        USER_ACTION(surname, password, action) */
    app.post('/userAction', (req, res) => {
        userSession(req, res, (session)=>{
            userAction(session.surname, req.body.action, req.body.value)
            res.json({ok:'ok', surname:session.surname})
        })
    })

    /*---------------------
    |      ACHETEUR      |
    ---------------------*/
    
    /* fn 20 lListe de Produit dans un restaurant
        LIST_PRODUIT_RESTAURANT(restaurant) */
    app.post('/listProduitRestaurant', (req, res) => {
        let sqlQuery = constants.LIST_PRODUIT_RESTAURANT(req.body.restaurant)
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })

    /* fn 23 produit recommandé apartire d'une autre produit, ( La plupart des acheteurs qui ont acheté X ont aussi acheté Y )
    RECOMMANDATION(surname) */
    app.post('/recommandation', (req, res) => {
        let sqlQuery = constants.RECOMMANDATION(req.body.nom)
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })

    inPanier = (req, session,callback) =>{
        let sqlQuery = constants.FIND_IN_PANIER(session.surname, session.password, req.body.produit, req.body.restaurant)
        connection.query(sqlQuery, (err, resultat) => {
            err ? callback( false ) : callback( resultat[0] ? false : true )
        })
    }

    panierPlus1 = (session, req, res)=>{
        let sqlQuery = constants.PANIER_QUANTITE_PRODUIT(req.body.produit, req.body.restaurant)
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : (
                    connection.query(constants.UPDATE_PANIER_QUANTITE(session.surname, session.password, req.body.produit, req.body.restaurant, req.body.quantite), (err, resultat) => {
                        err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat, n:-2 })
                    })
                )
        })
    }

    /* fn 29 ajouter un produits au panier
        ADD_PRODUIT_PANIER(surname, password, produit, restaurant,quantite) */
    app.post('/addProduitPanier', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.ADD_PRODUIT_PANIER(session.surname, session.password, req.body.produit, req.body.restaurant, req.body.info, req.body.quantite)
            inPanier(req,session,(solve)=>{
                solve ? (
                    connection.query(sqlQuery, (err, resultat) => {
                        err ? res.json({ok:false, err, n:-1}) : res.json({ok:true,resultat,n:1 })
                    })
                ):panierPlus1(session, req, res)
            })
        })
    })
    
    /* fr 29.1 liste des produits dans le pannier*/
    app.post('/listPanier', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.PANIER_LIST(session.surname, session.password)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
            })
        })
    })

    /* fn 30 effacer un produits du panier
        DEL_PRODUIT_PANIER(surname, password, produit) */
    app.post('/delProduitPanier', (req, res) => {
            userSession(req, res, (session)=>{
            let sqlQuery = constants.DEL_PRODUIT_PANIER(session.surname, session.password, req.body.produit, req.body.restaurant)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
            })
        })
    })
    
    /* fn 31 éditer un produits du panier
        EDIT_PRODUIT_PANIER(surname, password, produit, quantite) */
    app.post('/editProduitPanierQuantite', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.UPDATE_PANIER_QUANTITE(session.surname, session.password, req.body.produit, req.body.restaurant, req.body.quantite)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
            })
        })
        
        let sqlQuery = constants.UPDATE_PANIER_QUANTITE(surname, password, produit, restaurant, quantite )
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
        })
    })


    const newAchat = (req, res, session, panier) =>{
        let sqlQuery = constants.NEW_ACHATS(session.surname, session.password)
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : panierToAchat(req, res, session, panier)
        })
    }

    const panierCall = (req, res, session) =>{
        let sqlQuery = constants.PANIER_LIST(session.surname, session.password)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : (
                    //console.log('panier',resultat),
                    resultat.length > 0 ? newAchat(req, res, session, resultat) : res.json({ ok: false, msg: 'panier vide' })
                    ) 
        })
    }

    const panierToAchat = (req, res, session, panier) =>{
        var resFinal = panier.map((value, i)=>{
           // console.log(value.nom, i, session.surname, session.password, value.id_produit, value.prixTotal, value.quantite)
            let sqlQuery = constants.ADD_PRODUIT_ACHAT(session.surname, session.password, value.id_produit, value.prixTotal, value.quantite)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : console.log('ok panierToAchat')
            })
            return {nom:value.nom, total:value.prixTotal, quantite:value.quantite, status:'ok'}
        })
        viderPanier(req, res, session, resFinal)
    }

    const viderPanier = (req, res, session, response)=>{
        let sqlQuery = constants.DEL_PANIER(session.surname, session.password)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: response })
        })
    }

    app.post('/newAchat', (req, res) => {
            userSession(req, res, (session)=>{
                panierCall(req, res, session)
        })
    }) 

    app.post('/listAchat', (req, res) => {
            userSession(req, res, (session)=>{
            let sqlQuery = constants.ACHATS_LIST(session.surname, session.password)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
            })
        })
    }) 
    
    /* fn 33 lListe des achat déjà effectues
    ACHATS_LIST(surname, password) */
    app.post('/numAchatList', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.PRODUITS_ACHATS_LIST(session.surname, session.password, req.body.idAchat)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
            })
        })
    })

    /*---------------------
    |       VENDEUR       |
    ---------------------*/

    /* fn 35 créer une restaurant
        NEW_RESTAURANT(surname, password, nom, description, photoName, adresse, quartier, telephone) */
    app.post('/newRestaurant', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.NEW_RESTAURANT(session.surname, session.password, req.body.nom, 
                                                    req.body.description, req.body.photoName, req.body.adresse, 
                                                    req.body.quartier, req.body.telephone)          
            
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : (
                    userAction(session.surname,'CREER_RESTAURANT',req.body.nom),
                    res.json({ ok: true, response: resultat})
                )
            })
        })
    })

    /* fn 36 ajouter une catégorie
        NEW_CATEGORIE(surname, password, nom, description) */
    app.post('/newCategorie', (req, res) => {
        let sqlQuery = constants.NEW_CATEGORIE(req.body.nom, req.body.description)
        connection.query(sqlQuery, (err, resultat) => {
            err ? res.json({ ok: false, error: err }) : (
                console.log(gutil.colors.cyan('CREATE CATEGORIE', req.body.nom)),
                res.json({ ok: true,  response: resultat})
            )
        })
    })

    /* fn 37 ajouter un produits
        NEW_PRODUIT(surname, password, nom, description, photoName, categorie, restaurant, bio, prixBase) */
    app.post('/newProduit', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.NEW_PRODUIT(session.surname, session.password, req.body.nom, req.body.description, 
                                                req.body.photoName, req.body.categorie, req.body.restaurant, req.body.bio,
                                                req.body.prixBase)  

            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : (
                    userAction(session.surname,'CREER_PRODUIT',req.body.nom),
                    res.json({ ok: true, response: resultat })
                )
            })
        })
    })

    /* fn 40 éliminer un restaurant
        DEL_RESTAURANT(restaurant, surname, password, nom, description, photoName, adresse, quartier, telephone) */
    app.post('/delRestaurant', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.DEL_RESTAURANT(session.surname, session.password, req.body.nom)          
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : (
                    userAction(session.surname,'EFFACER_RESTAURANT',req.body.nom),
                    req.body.photoName !== 'null' ?  deleteFile(req.body.photoName) : console.log('sans photo'),
                    res.json({ ok: true, response: resultat, photoName:req.body.photoName })
                )
            })
        })
    })  

    /* fn 41 éliminer un produits
        DEL_PRODUIT(produit, surname, password, nom, description, photoName, categorie, restaurant, bio, prixBase) */
    app.post('/delProduit', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.DEL_PRODUIT(session.surname, session.password, req.body.nom, req.body.restaurant)          
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : (
                    userAction(session.surname,'EFFACER_PRODUIT',(req.body.nom+', '+req.body.restaurant)),
                    req.body.photoName !== 'null' ?  deleteFile(req.body.photoName) : console.log('sans photo'),
                    res.json({ ok: true, response: resultat })
                )
            })
        })
    })

    /* fn 43 voir les restaurant
        LIST_RESTAURANT_VENDEUR(surname, password) */
    app.post('/listRestaurantVendeur', (req, res) => {
        userSession(req, res, (session)=>{
            let sqlQuery = constants.LIST_RESTAURANT_VENDEUR(session.surname, session.password)
            connection.query(sqlQuery, (err, resultat) => {
                err ? res.json({ ok: false, error: err }) : res.json({ ok: true, response: resultat })
            })
        })
    })
}




module.exports.routerMysql = routerMysql;