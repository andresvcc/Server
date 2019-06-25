let chai = require('chai');
let chaiHttp = require('chai-http');
let server = require('../app');

chai.should();
chai.use(chaiHttp);

before(done => {
    console.log('\n\n-----------------------\n--\n-- START TEST\n--\n-------------------------');
    done();
});

after(done => {
    console.log('\n\n-----------------------\n--\n-- END TEST\n--\n-------------------------');
    done();
});

/*test */
describe(`#Test-Asynchronous sur l'API eastSHOP` , () => {

    it('login users', done => {
        chai.request(server)
            .post('/userLogin')
            .send({
                surname:'andres',
                password:'pass'
            })
            .then(res => {
                if(res.body.ok){
                    console.log(`Login ok sessID: ${res.body.sessID}, status code: ${res.statusCode}`)
                    chai.request(server)
                    .post('/userLogout')
                            .send({
                                id:res.body.sessID
                            })
                            .then(res => {
                                if(res.body.ok){
                                    console.log(`Logout ok`)
                                    done()
                                }else{
                                    done({err: res.body.resultat})
                                    console.log(`Test échoué logout: ${res.body.resultat}`)
                                }
                            })
                            .catch(err => {
                                done(err);
                            });
                }else{
                    done({err: res.body.resultat})
                    //console.log(`Test échoué login : ${res.body.resultat}`)
                }
            })
            .catch(err => {
                done(err);
            });
    }).timeout(0);

    it('list des utilisateurs', done => {
        chai.request(server)
            .post('/listUsers')
            .then(res => {
                if(res.body.ok){
                    done()
                    console.log(`status code: ${res.statusCode}, list des utilisateurs ok`)
                }else{
                    done({err: res.body.resultat})
                    console.log(`Test échoué : ${res.body.resultat}`)
                }
            })
            .catch(err => {
                done(err);
            });
    }).timeout(0);

    it('list des produits', done => {
        chai.request(server)
            .post('/listProduits')
            .then(res => {
                if(res.body.ok){
                    done()
                    console.log(`status code: ${res.statusCode}, list des produits oki ok`)
                }else{
                    done({err: res.body.resultat})
                    console.log(`Test list des produits échoué : ${res.body.resultat}`)
                }
            })
            .catch(err => {
                done(err);
            });
    }).timeout(0);

    it('list des vendeurs', done => {
        chai.request(server)
            .post('/listVendeurs')
            .then(res => {
                if(res.body.ok){
                    done()
                    console.log(`status code: ${res.statusCode}, list des vendeurs ok`)
                }else{
                    done({err: res.body.resultat})
                    console.log(`Test échoué : ${res.body.resultat}`)
                }
            })
            .catch(err => {
                done(err);
            });
    }).timeout(0);


})