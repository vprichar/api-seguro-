
var app = angular.module('myApp', ['textAngular']);



app.config(function ($httpProvider) {
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
});


app.controller('datasd', ['$scope','$http', '$filter','$location', function ($scope, $http, $filter ,$location) {


$scope.hola = "$scope.original_data;";
Highcharts.chart('graficas', {

      xAxis: {
            min: -0.5,
            max: 5.5
        },
        yAxis: {
            min: 0
        },
        title: {
            text: 'Notificaciones recibidas por dia'
        },
        series: [{
            type: 'line',
            name: 'Regression Line',
            data: [[0, 1.11], [5, 4.51],[4, 3.51]],
            marker: {
                enabled: false
            },
            states: {
                hover: {
                    lineWidth: 0
                }
            },
            enableMouseTracking: false
        }, {
            type: 'scatter',
            name: 'Observations',
            data: [[0, 1.11], [5, 4.51],[4, 3.51]],
            marker: {
                radius: 4
            }
        }]

      

    });


   


}]);




app.controller('BrandsCtrl', ['$scope','$http', '$filter','$location', function ($scope, $http, $filter ,$location) {

	  window.scope = $scope;

    $scope.custome;
    $scope.original_data = {};
    $scope.editorEnabled = false;


  $scope.edit = function (brand) {
    $scope.editorEnabled = brand.id;
    $scope.original_data = angular.copy(brand);
   // alert($scope.editorEnabled);
  };

  $scope.cancelEdit = function (){
    $scope.editorEnabled = false;
    $scope.brand = $scope.original_data;

  };


  $scope.saveEdit = function (brand) {
        $http.put('/customers/'+brand.id, brand).success(function(res){
            if(res.success){
                $scope.getData();
                $scope.editorEnabled = false;
               
                  alert( "oki =) ")
            }else{
                alert("creoq  que todo salio mal ")
            };
        });
    };


    Highcharts.chart('container', {

      chart: {
            width: 300,
            height: 200,
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false

        },
        title: {
            text: 'DEV',
            align: 'center',
            verticalAlign: 'middle',
            y: 40
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: 10,
                    style: {
                        fontWeight: 'bold',
                        color: 'black',
                        
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '70%']
            }
        },
        series: [{
            type: 'pie',
            name: 'Porcentaje',
            innerSize: '50%',
            data: [
                ['Andoid',   90],
                ['IOS',      10],
               
                {
                    name: 'Proprietary or Undetectable',
                    y: 0.2,
                    dataLabels: {
                        enabled: false
                    }
                }
            ]
        }]

      

    });


   


 



   $scope.getData = function () {
        $http.get('/customers.json')
            .success(function (data) {
                $scope.names = data.customers;
                $scope.segurosd = data.seguros;

            })
            .error(function () {
               Materialize.toast('404 ', 4000)
            });
    };


    $scope.getdevi = function () {
        $http.get('/devices.json')
            .success(function (data) {
                $scope.domiseguros = data.domiseguros;
            })
            .error(function () {
                Materialize.toast('Error 404 ', 4000)
            });
    };



    $scope.showUser = function(data){
            if ($scope.editorEnabled == false ){
            
              document.location = '/customers/'+data
                
           }else{
            Materialize.toast('Error 404', 4000)
           }
             
        };


    

   $scope.getdevi();
  $scope.getData();
   






     $scope.save = function (custome) {
        console.log(custome);
        $http.post('/customers', custome).success(function(res){
            if(res.success){
               // $scope.customers.push(res.customer);
                  $scope.getData();

                  $scope.customer = null;
                
            }else{
                 
                 Materialize.toast('Error al guardar ', 4000)
            };
        });
    };


    


   


}]);



app.controller('ShoCtrl', ['$scope','$http', '$filter','$location', function ($scope, $http, $filter ,$location) {


  $scope.getshow = function () {
        var  id=(/customers\/(\d+)/.exec($location.absUrl())[1]);
        $http.get('/customers/'+id+'.json')
            .success(function (data) {
                $scope.curomer = data.customers;
                $scope.device = data.device
                if  ( data.device == null ){
                  $scope.device ="El usuario no esta reguistrado"
                }else{
              
                 $scope.device = "usuario reguistrado"
                }

                $scope.seguros = data.seguros
            })
            .error(function () {
                alert("Error en petición")
            });
      
    };


    $scope.getseguros = function () {
        $http.get('/customers/fseguros.json')
            .success(function (data) {
              $scope.domiseguros = data.domiseguros;
              
            })
            .error(function () {
                alert("Error en petición")
            });
    };



    $scope.hasChanged = function() {
  var result = $filter('filter')( $scope.domiseguros, {id:$scope.seseguro })[0];
  $scope.seguro = null 
  $scope.seguro  = result;

  };



    $scope.submit = function() {
        if ($scope.text) {
          alert($scope.text)
       
        }
      };



//insurances

  $scope.saveseguros = function (seguros) {
        console.log(seguros);
        seguros.name = "hola mdo"

      seguros.customer_id  = (/customers\/(\d+)/.exec($location.absUrl())[1]);

        $http.post('/insurances', seguros).success(function(res){
        
            if(res.success){
           
                   $scope.getshow();
                   $scope.seguro = null

                    $('#modal1').closeModal();

                
                
            }else{
                 alert( "creoq  que todo se fue ala mierda ")
            };
        });
    };



    $scope.edit = function (brand) {
    $scope.editorEnabled = brand.id;
    $scope.original_data = angular.copy(brand);
   // alert($scope.editorEnabled);
  };

  $scope.cancelEdit = function (){
    $scope.editorEnabled = false;
    $scope.brand = $scope.original_data;

  };


  $scope.saveEdit = function (brand) {
      console.log(brand);
        $http.put('/insurances/'+brand.id, brand).success(function(res){
            if(res.success){
                $scope.getshow();
                $scope.editorEnabled = false;

            }else{
                alert("creoq  que todo salio mal ")
            };
        });
    };


    $scope.getshow();
    $scope.getseguros();



}]);



app.controller('insuranceCtrl', ['$scope','$http', '$filter','$location', function ($scope, $http, $filter ,$location) {
    

       $scope.getinsurance = function () {

        $http.get('/f_insurance.json')
            .success(function (data) {
              $scope.domiseguros = data.FInsurance;
            })
            .error(function () {
                alert("Error en petición")
            });
    };



     $scope.save = function (custome) {
        console.log(custome);
        $http.post('/f_insurance', custome).success(function(res){
            if(res.success){
                    alert("oki =) ")
                $('#modal1').closeModal();
                 $scope.getinsurance();
                
            }else{
                 alert( "creoq  que todo se fue ala mierda ")
            };
        });
    };




    $scope.modal = function(data){
 
              $scope.finsurancedata = data;
            $('#modal1').openModal();



        };


    $scope.saveEdit = function (brand) {
      console.log(brand);
        $http.put('/f_insurance/'+brand.id, brand).success(function(res){
            if(res.success){
                 $('#modal1').closeModal();

                  Materialize.toast('OK GO ', 4000)
            }else{
                alert("creoq  que todo salio mal ")
            };
        });
    };








$scope.getinsurance();

}]);












/////
/////
//////


