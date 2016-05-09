<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
//实现 拖拽功能

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>TRANSFORM</title>
		<meta charset="utf-8">
		<meta charset="utf-8">
		<style>
			body {
				font-family: Monospace;
				background-color: #000000;
				margin: 0px;
				overflow: hidden;
			}
			
			#info {
				color: #fff;
				position: absolute;
				top: 10px;
				width: 100%;
				text-align: center;
				z-index: 100;
				display: block;
			}

			div.floating {
				color : #ffffff;
				background : #000000;
				opacity : 0.8;
				width : 80%;
				height : 80%;
				position : absolute;
				left : 10%;
				top : 10%;
				border : 1px solid #555555;
				padding : 10px;
				display : none;
				overflow : auto;
				z-index: 100;
			}
			
			span.link {
				color: skyblue;
				cursor: pointer;
				/*text-decoration : underline;*/
			}
			
			a {
				color: skyblue
			}
            input {
                vertical-align: middle;
                height:25px;
                margin: 0;
                padding: 0
            }
            a.input {
             width:100px;
             height:25px;
             line-height:25px;
             background:#08f;
             text-align:center;
             display:inline-block;/*具有行内元素的视觉，块级元素

            的属性 宽高*/
             overflow:hidden;/*去掉的话，输入框也可以点击*/
             position:relative;/*相对定位，为 #file 的绝对定位准

            备*/
            }
            a.input:hover {
             background:#f80;
            }
            a{
             text-decoration:none;
             color:#FFF;
            }
            #file {
             opacity:0;/*设置此控件透明度为零，即完全透明*/
             filter:alpha(opacity=0);/*设置此控件透明度为零，即

            完全透明针对IE*/
             font-size:100px;
             position:absolute;/*绝对定位，相对于 .input */
             top:0;
             right:0;
            } 
          
		</style>

	</head>
	<body>
        <h1>
            
            <div id="info">
                
                <input type="text" id="a" readonly="readonly" />
                 <a href="javascript:void(0);" class="input">
                  浏览
                  <input type="file" id="file" onchange="loadf(this.files)">
                 </a> 
                
                    <!--<input type="file" onchange="loadf(this.files)"  />-->
                <span class="link" onclick="addGeometry(2)">添加</span>
                <span class="link" onclick="addGeometry()">载入</span>
                <select onchange="exform(this.value)" style="color : #ffffff;background : #000000;" >
                    <option value=''>请选择输出文件格式</option>
                    <option value='amf'>amf</option>
                    <option value='stl'>stl</option>
                    <option value='stlb'>stl binary</option>
                </select>
                <input type="text" id='filename' value='输出文件名' onfocus="if(value=='输出文件名'){value=''}"   
                onblur="if(value==''){value='输出文件名'}"  />
                <span class="link" onclick="tranS()">导出</span>,
                <input class="jscolor" onchange="changeColor(this.value)" value="ab2567">
                <a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/lib3d"%>">主页</a><!-- <span class="link" onclick="gradualChange()">渐变</span> -->

                
                <!--<span class="link" id="cylinder">cylinder</span>,
                <span class="link" id="both">both</span>,
                <span class="link" id="transformed">transformed</span>
                - <span class="link" id="export">export to obj</span>-->
            </div>
            <!--<div style="">
            <input type="text" id="bei" onblur="" class="pick-a-color">
            </div>-->
        </h1>
        
        
 <script src="js/three.min.js"></script>
  <script src="js/OBJExporter.js"></script>
                <script src="js/STLBinaryExporter.js"></script>
                        <script src="js/exporters/TypedGeometryExporter.js"></script>
		                  <script src="js/STLExporter.js"></script>
                            <script src="js/CreateAMF.js"></script>
                                <script src="js/controls/OrbitControls.js"></script>
                                    <script src="js/CreatFile.js"></script>
                                        <script src="js/view/AMFLoader.js"></script>
                                            <script src="js/view/STLLoader.js"></script>
		                                      <script src="js/TrackballControls.js"></script>
        <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <!--<script src="js/pickcolor.js"></script>-->
        <script src="js/jscolor.min.js"></script>
        <link rel="stylesheet" href="css/color.css">
        
        <script> 
            function changeColor(value){
                if(clickedobject!=null){
                    console.log(value);
                    var col = new THREE.Color(parseInt(''+value, 16));
                    clickedobject.material.color=col;
                    console.log(col);
                }
            }
            function gradualChange(){
                if(clickedobject!=null){
                    if ( clickedobject instanceof THREE.Geometry ) {
				        clickedobject = new THREE.Geometry().fromGeometry( clickedobject );
                    }
                    var lutColors = [];
                    for ( var i = 0; i < clickedobject.attributes.pressure.array.length; i++ ) {

						var colorValue = geometry.attributes.pressure.array[ i ];

						 var color = lut.getColor( colorValue );

						if ( color == undefined ) {

							console.log( "ERROR: " + colorValue );

						} else {

							lutColors[ 3 * i     ] = color.r;
							lutColors[ 3 * i + 1 ] = color.g;
							lutColors[ 3 * i + 2 ] = color.b;

						}

					}
                        
//				        clickedobject = new THREE.Geometry().fromGeometry( clickedobject );

                    
                }
            }
//            function stringToHex(str){
//                var val="";
//                for(var i = 0; i < str.length; i++){
//                  if(val == "")
//                    val = str.charCodeAt(i).toString(16);
//                  else
//                    val += "," + str.charCodeAt(i).toString(16);
//                }
//                return val;
//            }
//            $(document).ready(function () {
//
//                $(".pick-a-color").pickAColor({
//                  showSpectrum            : true,
//                    showSavedColors         : true,
//                    saveColorsPerElement    : true,
//                    fadeMenuToggle          : true,
//                    showAdvanced			: true,
//                    showBasicColors         : true,
//                    showHexInput            : true,
//                    allowBlank							: true,
//                    inlineDropdown					: true
//                 });
//			
//		   }); 
            
            

    
            var camera, scene, light, renderer,controls,raycaster,mouse,INTERSECTED/*是目前交互的物体*/;
			var exportButton;
//            var floatingDiv;
//			var mouseX = 0, mouseY = 0;
            //clickedobject是点击选中的object，dragobject是托从的物体
            var clickedobject=null,dragobject=null;
            var loadedFile="";
            var filename='',filen='' ,exportform='';
            //拖拽的平面
            var plane,offset = new THREE.Vector3();
            //选择导出文件格式
            
            
            
            
            
            
            function exform(value){
                exportform = value;
//                alert(exportform);
            }
            //加载文件
            function loadf(files)  
            {  
                if(files.length)  
                {  
                    var file = files[0];  
                    filename = file.name;
//                    alert(filename);
                    var reader = new FileReader();  
                    reader.onload = function()  
                    {  
                        loadedFile= this.result;  
                    };  
                    reader.readAsArrayBuffer(file); 
                    var input2 = document.getElementById("a"); 
                    input2.value=filename; 
                   // init();
                }  
            }  
            //点击渲染加载文件 加入场景
            function addGeometry(para){
                
                
                //添加和重新载入
                if(para != 2){
                    //重新载入
                    for (var i = 0; i < scene.children.length; i++) {
                        var current = scene.children[i];
                        if(current!=plane){
                            if (current instanceof THREE.Mesh||current instanceof THREE.Group||current instanceof THREE.Line) {
                            scene.children.splice(i,1);
                            i--;
                            }
                        }
                        
				    }
//                    scene.add( plane );
                }
                if(para==1){
                
	                var filestyle = '<%=request.getParameter("type")%>';
	                if(filestyle=='.amf'){
	                   	var loader = new THREE.AMFLoader();
						loader.load( '<%=request.getParameter("url")%>', function ( amfobject ) {
	
						scene.add( amfobject );
						render();
	
						} );
	                 }else if(filestyle=='.stl'){
	                    var loader = new THREE.STLLoader();
						loader.load( '<%=request.getParameter("url")%>', function ( geometry ) {
	
						var material = new THREE.MeshPhongMaterial( { color: 0xff5533, specular: 0x111111, shininess: 200 } );
						var mesh = new THREE.Mesh( geometry, material );
	
						scene.add( mesh );
						} );
	                }
                }else{
                    if(filename!=''){
                        var f = filename.split('.');
                        var len = f.length;
                        var loader;
                        if(len>0){
                            filen=f[0];
                            var filestyle = f[1].toLowerCase();
                            if(filestyle=='amf'){
                                loader = new THREE.AMFLoader();
//                                scene.add(loader.parse(loadedFile));
                                console.log(':::');
                                console.log(scene);
                                loader.parse(loadedFile,scene);
                                console.log('::::');
                                console.log(scene);
                            }else if(filestyle=='stl'){
                                loader = new THREE.STLLoader();
                                var material = new THREE.MeshPhongMaterial( { color: 0xff5533, specular: 0x111111, shininess: 200 } );
                                var geo = loader.parse(loadedFile/*getBin()*/)
                                geo.computeFaceNormals ();
                                var mesh = new THREE.Mesh( geo, material );
                                
                                scene.add(mesh);
                            }else{
                                return 0;
                            }
                            
                        }
                    }
                }
				
            }
            //获取二进制文件
            function getBin(){
//                 var array_buffer = new Uint8Array( loadedFile.length );
//                 for ( var i = 0; i < loadedFile.length; i ++ ) {
//                     array_buffer[ i ] = loadedFile.charCodeAt( i ) ; // implicitly assumes little-endian
//                 }
//                return array_buffer.buffer || array_buffer;
                var buf = new ArrayBuffer(loadedFile.length*2); // 每个字符占用2个字节
                var bufView = new Uint16Array(buf);
                for (var i=0, strLen=loadedFile.length; i<strLen; i++) {
                     bufView[i] = loadedFile.charCodeAt(i);
                }
                return buf;
            }
            
            //初始化
            function init() {

				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				document.body.appendChild( renderer.domElement );

				camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 1000 );
				camera.position.set (0, 0, 400);

				scene = new THREE.Scene();

				light = new THREE.DirectionalLight( 0xffffff );
				scene.add( light );

				addGeometry (1);
				
				window.addEventListener( 'click', onWindowClick, false );
				window.addEventListener( 'resize', onWindowResize, false );
				document.addEventListener( 'mousemove', onDocumentMouseMove, false );
				document.addEventListener( 'mouseover', onDocumentMouseMove, false );
				
				
//				exportButton = document.getElementById( 'export' );
//				exportButton.addEventListener( 'click', function() { exportToObj (); });
				
//				floatingDiv = document.createElement ('div');
//				floatingDiv.className = 'floating';
//				document.body.appendChild (floatingDiv);
                
                
//                var controls = new THREE.OrbitControls( camera, renderer.domElement );
                
                    
//                plane = new THREE.Mesh(
//                     new THREE.PlaneBufferGeometry( 2000, 2000, 8, 8 ),
//                     new THREE.MeshBasicMaterial( { visible: true,color: Math.random() * 0xffffff} )
//				);
                controls = new THREE.TrackballControls( camera );
				controls.rotateSpeed = 1.0;
				controls.zoomSpeed = 1.2;
				controls.panSpeed = 0.8;
				controls.noZoom = false;
				controls.noPan = false;
				controls.staticMoving = true;
				controls.dynamicDampingFactor = 0.3;
                
                mouse = new THREE.Vector2();
                raycaster = new THREE.Raycaster();
                
//                document.addEventListener( 'mousemove', onDocumentMouseMove, false );
//				document.addEventListener( 'mousedown', onDocumentMouseDown, false );
                
//				controls.addEventListener( 'change', render );
//				controls.target.set( 0, 1.2, 2 );
//				controls.update();
                
			}
//            function render() {
//                controls.update();
//				renderer.render( scene, camera );
//
//			}
            
            function onWindowClick(event) {
                console.log(scene);
                if(INTERSECTED!=null){
                    var material = new THREE.LineBasicMaterial( { color: 0xffffff, linewidth: 2, transparent: true } );
                    removeLine();
                    line = new THREE.Line( INTERSECTED.geometry, material );
                    line.position.x = INTERSECTED.position.x;
                    line.position.y = INTERSECTED.position.y;
                    line.position.z = INTERSECTED.position.z;
                    scene.add( line );
                    clickedobject = INTERSECTED;
                }
			}
            function removeLine(){
                for (var i = 0; i < scene.children.length; i++) {
					var current = scene.children[i];
					if (current instanceof THREE.Line) {
                        scene.children.splice(i,1);
                        i--;
					}
				}
            }
            
            function onDocumentMouseMove( event ) {

				event.preventDefault();

				mouse.set( ( event.clientX / window.innerWidth ) * 2 - 1, - ( event.clientY / window.innerHeight ) * 2 + 1 );

				raycaster.setFromCamera( mouse, camera );

				var intersects = raycaster.intersectObjects(  scene.children );
                
				if ( intersects.length > 0 &&!(intersects[ 0 ].object instanceof THREE.Line)) {
                   if ( INTERSECTED != intersects[ 0 ].object ) {
                        console.log(intersects[ 0 ].object);
                        if ( INTERSECTED ) INTERSECTED.material.emissive.setHex( INTERSECTED.currentHex );

                        INTERSECTED = intersects[ 0 ].object;
                        INTERSECTED.currentHex = INTERSECTED.material.emissive.getHex();
                        INTERSECTED.material.emissive.setHex( 0xff0000 );

                    }
					

				}else {

					if ( INTERSECTED ) INTERSECTED.material.emissive.setHex( INTERSECTED.currentHex );

					INTERSECTED = null;

				}

			}	
			
			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

//			function onDocumentMouseMove( event ) {
//
//				var windowHalfX = window.innerWidth / 2;
//				var windowHalfY = window.innerHeight / 2;
//				mouseX = ( event.clientX - windowHalfX ) / 2;
//				mouseY = ( event.clientY - windowHalfY ) / 2;
//
//			}

			function animate() {

				requestAnimationFrame( animate );
                controls.update();
//				camera.position.x += ( mouseX - camera.position.x ) * .05;
//				camera.position.y += ( -mouseY - camera.position.y ) * .05;
//				camera.lookAt( scene.position );

				light.position.set( camera.position.x, camera.position.y, camera.position.z ).normalize ();
				renderer.render( scene, camera );

			}
            init();
			animate();
            
            
            function exportToObj ()
			{
                var work = new Worker('js/CreateWorker.js');
                var s = JSON.stringify(scene);
               
               
//                work.postMessage({a:44,d:'55'});
//                console.log(s);
				/*var exporter = new THREE.CreateAMF ();
				var result =  exporter.parse (scene);
				 var res= result.split ('\n').join ('<br />');
                THREE.CreatFile('m.amf',res);
                alert(res);*/
			}
            function tranS(){
                
                var inputfilename = document.getElementById("filename"); 
                if(inputfilename.value!='输出文件名'){
                    filen=inputfilename.value;
                }
                var exporter ;
                var fi = '';
                if(exportform == 'amf'){
                    exporter = new THREE.CreateAMF();
                    if(filen!=''){
                        fi = filen+'.amf';
                    }else{
                        fi = 'default.amf';
                    }
                }else if(exportform=='stl'){
                    exporter = new THREE.STLExporter();
                    if(filen!=''){
                        fi = filen+'.stl';
                    }else{
                        fi = 'default.stl';
                    }
                }else if(exportform=='stlb'){
                    exporter = new THREE.STLBinaryExporter();
                    if(filen!=''){
                        fi = filen+'.stl';
                    }else{
                        fi = 'default.stl';
                    }
                }else{
                    alert('请选择输出文件格式！');
                    return 0;
                }
                var result = exporter.parse (scene);
//				floatingDiv.style.display = 'block';
//				floatingDiv.innerHTML = result.split ('\n').join ('<br />');
                exportToFile(fi,result);
            }
            
            function exportToFile(fileName, content){
                var aLink = document.createElement('a');
                var blob = new Blob([content]);
                var evt = document.createEvent("HTMLEvents");
                evt.initEvent("click", false, false);//initEvent 不加后两个参数在FF下会报错, 感谢 Barret Lee 的反馈
                aLink.download = fileName;
                aLink.href = URL.createObjectURL(blob);
                aLink.dispatchEvent(evt);
            }
            

		</script>
	</body>
</html>
