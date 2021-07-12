
/* TFM MARIA OTERO ALONSO */

ods graphics off;
ODS HTML close;
ods listing;

/* Importamos el archivo previamente limpio de SAS MINER */

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos ;set discoc.datos_limpios_train ;run;

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos2 ;set discoc.datos_limpios_transfor_train ;run;

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos3 ;set discoc.datos_limpios_todos_train ;run;

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos4 ;set discoc.datos_limpios_cluster_train ;run;

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos5 ;set discoc.datos_alfabeto_train ;run;

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos6 ;set discoc.ABC_TRANSFORMADOS_train ;run;

libname discoc 'C:\Users\usuario\Desktop\TFM\DATOS_SAS';
data datos7 ;set discoc.MUESTRA_train ;run;


/* 1. Sin interacciones, Datos transformados y sin transformar */

			/* %randomselect*/

%randomselectlog(data=datos5,
listclass=ao	ar	as	at	au	av	aw	bf	bg	bh	bi	bj	bk	bl	bm	bn	bp	bq	br	bt	bu	bw	bx	by	bz	ca	cb	cc	ce	cf	cg	ch	cj	ck	cl	cm	cn	co	cq	cr	cs	ct	e	f	g,
vardepen=b,
modelo=ao	ar	as	at	au	av	aw	bf	bg	bh	bi	bj	bk	bl	bm	bn	bp	bq	br	bt	bu	bw	bx	by	bz	ca	cb	cc	ce	cf	cg	ch	cj	ck	cl	cm	cn	co	cq	cr	cs	ct	e	f	g aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	be	bo	bs	bv	c	cd	ci	cp	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
sinicio=12300,sfinal=12700,fracciontrain=0.8, directorio= C:\Users\usuario\Desktop\TFM\Directorio);

/* 2. Sin interacciones, Cluster de variables transformadas y sin transformar */

			/* %randomselect*/
%randomselectlog(data=datos5,
listclass=at	ar	as	aw	au	av	bf	bg	bj	bk	bl	bp	bq	bt	by	cb	cc	ce	cf	cg	cj	cl	cm	cn	co	cs	ct	ao	f	g	e,
vardepen=b,
modelo=at	ar	as	aw	au	av	bf	bg	bj	bk	bl	bp	bq	bt	by	cb	cc	ce	cf	cg	cj	cl	cm	cn	co	cs	ct	ao	f	g	e	be	x	z	ab	w	ag	i	an	t	s	u	h	c	ai	ak	ay	ba	bb	bd	d	ci	cp	ac	af	ad	ax	aj	ae,
sinicio=12300,sfinal=12700,fracciontrain=0.8, directorio= C:\Users\usuario\Desktop\TFM\Directorio);



/* Grupos de variables:

A. Primer grupo laxo: Todas las variables sin transformar																																											
Clase =	Otros_centros_peque_os_ense_anza	G_Nom_Barri	G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	G_Velocidad_via	G_Riesgo_Interseccion	Sentido_via	Puente_o_tunel	Railway_in_street_Intersecciones																																	
Intervalo = Aparcamiento_Motos	Aparcamiento_Otros	Inventari_Semafors	NUM_CEDA_STOP	Restaurants	Menaje_hogar	Cotidiano_alimentario	Cotidiano_no_alimentario	Equipamiento_personal	Reparaciones	Financieras_y_aseguradoras	Otros_Comercios	Distancia_Ense_anza_Infantil	Distancia_Ense_anza	Ocio_y_cultura_peque_os	numMissing	IMP_REP_Farmacias	IMP_REP_Num_CEDA	IMP_REP_Num_STOP	IMP_REP_Pendiente	IMP_REP_Terrazas	IMP_REP_Vitalidad	Interseccion_diff_velocidad	Distancia_Radares_y_camaras	Distancia_Curva_peligrosa	Distancia_Espacios_de_musica_y_c	Distancia_Hoteles_pensiones_otro	Distancia_Hospitales_de_atencion	Distancia_Bibliotecas_museos_cin	Distancia_Parques_y_jardines	Distancia_Residencias_y_centros_	Distancia_Lugares_de_culto	Distancia_Mercados_y_ferias_call	Distancia_Mercados_municipales	Distancia_Mercados_y_ferias_cal1	Distancia_Espacios_de_participac	Distancia_Playa	Distancia_Atracciones_turisticas	Arboleda_Viaria	Aparcamiento	Aparcamiento_Coches	Aparcamiento_Bicis	
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	

B. Segundo grupo seleccion 1: Todas las variables transformadas y sin transformar con seleccion de variables (BIC)		
Clase = G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Cotidiano_no_alimentario	OPT_Distancia_Atracciones_turist	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza_Infantil	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Lugares_de_culto	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Mercados_y_ferias1	OPT_Distancia_Parques_y_jardines	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Terrazas	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Ocio_y_cultura_peque_os	OPT_Otros_Comercios	OPT_Restaurants	Railway_in_street_Intersecciones														
Intervalo = Cotidiano_alimentario	Reparaciones	Otros_Comercios	Distancia_Ense_anza_Infantil	LG10_Distancia_Hoteles_pensiones	Distancia_Roundabout	Interseccion_diff_velocidad	Distancia_Hoteles_pensiones_otro	Distancia_Parques_y_jardines	Distancia_Mercados_municipales	Distancia_Espacios_de_participac	Distancia_Playa	Distancia_Atracciones_turisticas	Arboleda_Viaria	Aparcamiento_Coches																												
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												

C. Tercer grupo seleccion 2: Todas las variables transformadas y sin transformar con seleccion de variables (BIC)	
Clase = G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Cotidiano_no_alimentario	OPT_Distancia_Atracciones_turist	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza_Infantil	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Lugares_de_culto	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Mercados_y_ferias1	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Terrazas	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Ocio_y_cultura_peque_os	OPT_Otros_Comercios	OPT_Restaurants	Railway_in_street_Intersecciones															
Intervalo = Otros_Comercios	Distancia_Ense_anza	numMissing	LG10_Distancia_Hoteles_pensiones	Distancia_Roundabout	Interseccion_diff_velocidad	Distancia_Hoteles_pensiones_otro	Distancia_Mercados_municipales	Distancia_Espacios_de_participac	Distancia_Playa	Distancia_Atracciones_turisticas	Arboleda_Viaria	Aparcamiento_Coches																														
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														

D. Cuarto grupo cluster: Todas los cluster de variables sin transformar		
Clase = Otros_centros_peque_os_ense_anza	G_Nom_Barri	G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	G_Velocidad_via	G_Riesgo_Interseccion	Sentido_via	Puente_o_tunel	Railway_in_street_Intersecciones																																	
Intervalo = Aparcamiento_Otros	Inventari_Semafors	NUM_CEDA_STOP	Restaurants	Menaje_hogar	Cotidiano_alimentario	Equipamiento_personal	Reparaciones	Financieras_y_aseguradoras	Distancia_Ense_anza	numMissing	IMP_REP_Farmacias	IMP_REP_Num_STOP	IMP_REP_Pendiente	IMP_REP_Vitalidad	Distancia_Roundabout	Interseccion_diff_velocidad	Distancia_Radares_y_camaras	Distancia_Curva_peligrosa	Distancia_Mercados_y_ferias_cal1	Distancia_Espacios_de_participac	Distancia_Playa	Arboleda_Viaria	Aparcamiento	Aparcamiento_Bicis																		
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		

E. Quinto grupo cluster seleccion 1: Todas las variables de los clusteres transformados y sin transformar con seleccion de variables (BIC)		
Clase = G_Nom_Barri	G_Nom_Districte	G_Riesgo_Interseccion	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Restaurants	Railway_in_street_Intersecciones																						
Intervalo = Inventari_Semafors	Equipamiento_personal	Distancia_Ense_anza	Interseccion_diff_velocidad	Distancia_Espacios_de_participac	Distancia_Playa	Arboleda_Viaria	Aparcamiento																																			
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			

F. Sexto grupo cluster seleccion 2: Quinto grupo + Distancia_Mercados_y_ferias_cal1 + Cotidiano_alimentario	
Clase = G_Nom_Barri	G_Nom_Districte	G_Riesgo_Interseccion	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Restaurants	Railway_in_street_Intersecciones																						
Intervalo = Inventari_Semafors	Cotidiano_alimentario	Equipamiento_personal	Distancia_Ense_anza	Interseccion_diff_velocidad	Distancia_Mercados_y_ferias_cal1	Distancia_Espacios_de_participac	Distancia_Playa	Arboleda_Viaria	Aparcamiento																																	
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x																																	

G. Septimo grupo cluster seleccion 3: Quinto grupo + Distancia_Mercados_y_ferias_cal1		
Clase = G_Nom_Barri	G_Nom_Districte	G_Riesgo_Interseccion	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Restaurants	Railway_in_street_Intersecciones																						
Intervalo = Inventari_Semafors	Equipamiento_personal	Distancia_Ense_anza	Interseccion_diff_velocidad	Distancia_Mercados_y_ferias_cal1	Distancia_Espacios_de_participac	Distancia_Playa	Arboleda_Viaria	Aparcamiento																																		
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	s	t	u	w	x																																		

H. Octavo grupo restrictivo: Seleccion manual de variables segun grafico V de Cramer		
Clase = G_Nom_Barri	G_Nom_Districte	G_Bicicletas	G_Tipo_de_via																																							
Intervalo = Aparcamiento_Motos	Aparcamiento_Otros	Inventari_Semafors	Menaje_hogar	Financieras_y_aseguradoras	IMP_REP_Terrazas	IMP_REP_Vitalidad	Distancia_Radares_y_camaras	Distancia_Espacios_de_musica_y_c	Distancia_Hoteles_pensiones_otro	Distancia_Hospitales_de_atencion	Distancia_Mercados_municipales	Distancia_Mercados_y_ferias_cal1	Arboleda_Viaria	Aparcamiento	Aparcamiento_Coches																											
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
	

/*****************************
MODELOS DE REGRESION LOGISTICA 
******************************/

/* A. Primer grupo laxo */		
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti= Aparcamiento_Motos	Aparcamiento_Otros	Inventari_Semafors	NUM_CEDA_STOP	Restaurants	Menaje_hogar	Cotidiano_alimentario	Cotidiano_no_alimentario	Equipamiento_personal	Reparaciones	Financieras_y_aseguradoras	Otros_Comercios	Distancia_Ense_anza_Infantil	Distancia_Ense_anza	Ocio_y_cultura_peque_os	numMissing	IMP_REP_Farmacias	IMP_REP_Num_CEDA	IMP_REP_Num_STOP	IMP_REP_Pendiente	IMP_REP_Terrazas	IMP_REP_Vitalidad	Interseccion_diff_velocidad	Distancia_Radares_y_camaras	Distancia_Curva_peligrosa	Distancia_Espacios_de_musica_y_c	Distancia_Hoteles_pensiones_otro	Distancia_Hospitales_de_atencion	Distancia_Bibliotecas_museos_cin	Distancia_Parques_y_jardines	Distancia_Residencias_y_centros_	Distancia_Lugares_de_culto	Distancia_Mercados_y_ferias_call	Distancia_Mercados_municipales	Distancia_Mercados_y_ferias_cal1	Distancia_Espacios_de_participac	Distancia_Playa	Distancia_Atracciones_turisticas	Arboleda_Viaria	Aparcamiento	Aparcamiento_Coches	Aparcamiento_Bicis,
categor= Otros_centros_peque_os_ense_anza	G_Nom_Barri	G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	G_Velocidad_via	G_Riesgo_Interseccion	Sentido_via	Puente_o_tunel	Railway_in_street_Intersecciones,
ngrupos=4,sinicio=12345,sfinal=12365);
data final1;set final;modelo=1;
	
/* B. Segundo grupo seleccion 1 */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti= Cotidiano_alimentario	Reparaciones	Otros_Comercios	Distancia_Ense_anza_Infantil	LG10_Distancia_Hoteles_pensiones	Distancia_Roundabout	Interseccion_diff_velocidad	Distancia_Hoteles_pensiones_otro	Distancia_Parques_y_jardines	Distancia_Mercados_municipales	Distancia_Espacios_de_participac	Distancia_Playa	Distancia_Atracciones_turisticas	Arboleda_Viaria	Aparcamiento_Coches,
categor= G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Cotidiano_no_alimentario	OPT_Distancia_Atracciones_turist	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza_Infantil	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Lugares_de_culto	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Mercados_y_ferias1	OPT_Distancia_Parques_y_jardines	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Terrazas	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Ocio_y_cultura_peque_os	OPT_Otros_Comercios	OPT_Restaurants	Railway_in_street_Intersecciones,
ngrupos=4,sinicio=12345,sfinal=12365);
data final2;set final;modelo=2;

/* C. Tercer grupo seleccion 2 */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti= Distancia_Ense_anza	numMissing	Otros_Comercios	LG10_Distancia_Hoteles_pensiones	Distancia_Roundabout	Interseccion_diff_velocidad	Distancia_Hoteles_pensiones_otro	Distancia_Mercados_municipales	Distancia_Espacios_de_participac	Distancia_Playa	Distancia_Atracciones_turisticas	Arboleda_Viaria	Aparcamiento_Coches,
categor= G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Cotidiano_no_alimentario	OPT_Distancia_Atracciones_turist	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza_Infantil	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Lugares_de_culto	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Mercados_y_ferias1	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Terrazas	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Ocio_y_cultura_peque_os	OPT_Otros_Comercios	OPT_Restaurants	Railway_in_street_Intersecciones,
ngrupos=4,sinicio=12345,sfinal=12365);
data final3;set final;modelo=3;

/* C. Cuarto grupo cluster */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti= Distancia_Roundabout	Interseccion_diff_velocidad	Distancia_Radares_y_camaras	Distancia_Curva_peligrosa	Distancia_Mercados_y_ferias_cal1	Distancia_Espacios_de_participac	Distancia_Playa	Arboleda_Viaria	Aparcamiento	Aparcamiento_Bicis	Aparcamiento_Otros	Inventari_Semafors	NUM_CEDA_STOP	Restaurants	Menaje_hogar	Cotidiano_alimentario	Equipamiento_personal	Reparaciones	Financieras_y_aseguradoras	Distancia_Ense_anza	numMissing	IMP_REP_Farmacias	IMP_REP_Num_STOP	IMP_REP_Pendiente	IMP_REP_Vitalidad,
categor= Sentido_via	Puente_o_tunel	Railway_in_street_Intersecciones	Otros_centros_peque_os_ense_anza	G_Nom_Barri	G_Nom_Districte	G_Bicicletas	G_Tipo_de_via	G_Velocidad_via	G_Riesgo_Interseccion,
ngrupos=4,sinicio=12345,sfinal=12365);
data final4;set final;modelo=4;

/* D. Quinto grupo cluster seleccion 1 */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti=Aparcamiento	Arboleda_Viaria	Distancia_Ense_anza	Distancia_Espacios_de_participac	Distancia_Playa	Equipamiento_personal	Interseccion_diff_velocidad	Inventari_Semafors,
categor=G_Nom_Barri	G_Nom_Districte	G_Riesgo_Interseccion	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Restaurants	Railway_in_street_Intersecciones,
ngrupos=4,sinicio=12345,sfinal=12365);
data final5;set final;modelo=5;

/* E. Sexto grupo cluster seleccion 2 */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti=Distancia_Mercados_y_ferias_cal1 Cotidiano_alimentario Aparcamiento	Arboleda_Viaria	Distancia_Ense_anza	Distancia_Espacios_de_participac	Distancia_Playa	Equipamiento_personal	Interseccion_diff_velocidad	Inventari_Semafors,
categor=G_Nom_Barri	G_Nom_Districte	G_Riesgo_Interseccion	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Restaurants	Railway_in_street_Intersecciones,
ngrupos=4,sinicio=12345,sfinal=12365);
data final6;set final;modelo=6;

/* F. Septimo grupo cluster seleccion 3 */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti=Distancia_Mercados_y_ferias_cal1 Aparcamiento	Arboleda_Viaria	Distancia_Ense_anza	Distancia_Espacios_de_participac	Distancia_Playa	Equipamiento_personal	Interseccion_diff_velocidad	Inventari_Semafors,
categor=G_Nom_Barri	G_Nom_Districte	G_Riesgo_Interseccion	OPT_Aparcamiento	OPT_Aparcamiento_Otros	OPT_Arboleda_Viaria	OPT_Cotidiano_alimentario	OPT_Distancia_Curva_peligrosa	OPT_Distancia_Ense_anza	OPT_Distancia_Espacios_de_partic	OPT_Distancia_Mercados_y_ferias_	OPT_Distancia_Playa	OPT_Distancia_Radares_y_camaras	OPT_Equipamiento_personal	OPT_Financieras_y_aseguradoras	OPT_IMP_REP_Pendiente	OPT_IMP_REP_Vitalidad	OPT_Inventari_Semafors	OPT_Menaje_hogar	OPT_Restaurants	Railway_in_street_Intersecciones,
ngrupos=4,sinicio=12345,sfinal=12365);
data final7;set final;modelo=7;

/* G. Octavo grupo restrictivo */	
%cruzadalogistica
(archivo=datos3,vardepen=Incidencia_Accidente_por_metro,
conti= Aparcamiento	Aparcamiento_Coches	Aparcamiento_Motos	Aparcamiento_Otros	Arboleda_Viaria	Distancia_Espacios_de_musica_y_c	Distancia_Hospitales_de_atencion	Distancia_Hoteles_pensiones_otro	Distancia_Mercados_municipales	Distancia_Mercados_y_ferias_cal1	Distancia_Radares_y_camaras	Financieras_y_aseguradoras	IMP_REP_Terrazas	IMP_REP_Vitalidad	Inventari_Semafors	Menaje_hogar,
categor= G_Bicicletas G_Nom_Barri G_Nom_Districte G_Tipo_de_via,
ngrupos=4,sinicio=12345,sfinal=12365);
data final8;set final;modelo=8;


 
data union;set final1 final2 final3 final4 final5 final6 final7 final8;
proc boxplot data=union;plot media*modelo;run;

 
data union;set final2 final3;
proc boxplot data=union;plot media*modelo;run;





/*********************************
ESTUDIO DEL NUMERO DE NODOS OPTIMO 
*********************************/

/* 
Primer grupo
*/

	/* LEVMAR*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
   listclass= ao	ar	as	at	au	av	aw	e	f	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=levmar);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=4,increnodos=1);


	/* BPROP*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
   listclass= ao	ar	as	at	au	av	aw	e	f	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=bprop mom=0.2 learn=0.1);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=4,increnodos=1);


/* 
Segundo grupo
*/

	/* LEVMAR*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
   listclass= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=levmar);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=4,increnodos=1);


	/* BPROP*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
   listclass= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=bprop mom=0.2 learn=0.1);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=4,increnodos=1);



/* 
Tercer grupo
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														

*/

	/* LEVMAR*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
   listclass= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=levmar);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=4,increnodos=1);


	/* BPROP*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= al an	ax	bv	c	d	k	r	t	u	v	w	y,
   listclass= as at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=bprop mom=0.2 learn=0.1);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=4,increnodos=1);



/* 
Cuarto grupo
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

	/* LEVMAR*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
   listclass= ao	ar	as	at	au	av	aw	e	f	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=levmar);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=6,increnodos=1);


	/* BPROP*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= ab ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
   listclass= ao ar	as	at	au	av	aw	e	f	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=bprop mom=0.2 learn=0.1);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=6,increnodos=1);


/* 
Quinto, sexto y septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			

*/

	/* LEVMAR*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= ac ai	an	d	t	u	w	x,
   listclass= ar as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=levmar);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=5,increnodos=1);


	/* BPROP*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= ac ai	an	d	t	u	w	x,
   listclass= ar as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=bprop mom=0.2 learn=0.1);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=5,increnodos=1);



/* 
Octavo grupo
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/

	/* LEVMAR*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
   listclass= ar	as	at	au, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=levmar);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=9,increnodos=1);


	/* BPROP*/
%macro variar(seminicio=,semifin=,inicionodos=,finalnodos=,increnodos=);
title '';
data union;run;
%do semilla=&seminicio %to &semifin;
%do nodos=&inicionodos %to &finalnodos %by &increnodos;
   %neuralbinariabasica(archivo=datos6,
   listconti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
   listclass= ar	as	at	au, vardep=b,nodos=&nodos,corte=50,semilla=&semilla,porcen=0.80,algo=bprop mom=0.2 learn=0.1);
   data estadisticos;set estadisticos;nodos=&nodos;semilla=&semilla;run;
   data union;set union estadisticos;run;
%end;
%end;
proc sort data=union;by nodos;run;
proc boxplot data=union;plot (porcenVN porcenFN porcenVP porcenFP 
sensi especif tasafallos tasaciertos precision F_M)*nodos;run;
%mend;
%variar(seminicio=12345,semifin=12355,inicionodos=1,finalnodos=9,increnodos=1);



/*************************
ESTUDIO DEL EARLY STOPPING 
**************************/

/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/

/* Levmar */
%redneuronalbinaria(archivo=datos6,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
vardep=b,porcen=0.80,semilla=442711,ocultos=3,meto=levmar,acti=tanh);

/* BPROP */
%redneuronalbinaria(archivo=datos6,listclass= ,
listconti= ,
vardep=b,porcen=0.80,semilla=442711,ocultos=3,meto=bprop mom=0.2 learn=0.1);

/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												

*/

/* Levmar */
%redneuronalbinaria(archivo=datos6,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
vardep=b,porcen=0.80,semilla=442711,ocultos=2,meto=levmar,acti=tanh);

/* BPROP */
%redneuronalbinaria(archivo=datos6,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g ,
listconti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
vardep=b,porcen=0.80,semilla=442711,ocultos=2,meto=bprop mom=0.2 learn=0.1);

/* 
Tercer Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														

*/

/* Levmar */
%redneuronalbinaria(archivo=datos6,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
vardep=b,porcen=0.80,semilla=442711,ocultos=2,meto=levmar,acti=tanh);

/* BPROP */
%redneuronalbinaria(archivo=datos6,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
vardep=b,porcen=0.80,semilla=442711,ocultos=2,meto=bprop mom=0.2 learn=0.1);

/* 
Cuarto Grupo:
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

/* Levmar */
%redneuronalbinaria(archivo=datos6,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
vardep=b,porcen=0.80,semilla=442711,ocultos=3,meto=levmar,acti=tanh);

/* BPROP */
%redneuronalbinaria(archivo=datos6,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
vardep=b,porcen=0.80,semilla=442711,ocultos=4,meto=bprop mom=0.2 learn=0.1);

/* 
Quinto, sexto y septimo Grupo: 
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

/* Levmar */
%redneuronalbinaria(archivo=datos6,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	t	u	w	x,
vardep=b,porcen=0.80,semilla=442711,ocultos=2,meto=levmar,acti=tanh);

/* BPROP */
%redneuronalbinaria(archivo=datos6,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	t	u	w	x,
vardep=b,porcen=0.80,semilla=442711,ocultos=2,meto=bprop mom=0.2 learn=0.1);

/* 
Octavo Grupo: 
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/

/* Levmar */
%redneuronalbinaria(archivo=datos6,listclass=ar	as	at	au,
listconti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
vardep=b,porcen=0.80,semilla=442711,ocultos=3,meto=levmar,acti=tanh);

/* BPROP */
%redneuronalbinaria(archivo=datos6,listclass=ar	as	at	au,
listconti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
vardep=b,porcen=0.80,semilla=442711,ocultos=7,meto=bprop mom=0.2 learn=0.1);


/**************************
MODELOS DE REDES NEURONALES   
***************************/

/* GRUPO 1
MODELO 9: ngrupos=4, nodos=3,early=500,algo=levmar, acti=tanh
MODELO 10:ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=5,algo=levmar, acti=tanh);
MODELO 11:ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.2,learn=0.1, acti=tanh);
MODELO 12: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=5,algo=bprop mom=0.8 learn=0.2, acti=tanh);
MODELO 13: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 14: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=5,algo=bprop mom=0.8 learn=0.2), acti=tanh);
MODELO 15: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 16: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=5,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 17: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=500,algo=levmar,acti=LIN);
MODELO 18: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=5,algo=levmar,acti=LIN);
*/

/* GRUPO 2
MODELO 19: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar, acti=tanh);
MODELO 20:ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=7,algo=levmar, acti=tanh);
MODELO 21:ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.2,learn=0.1, acti=tanh);
MODELO 22: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.2, learn=0.1, acti=tanh);
MODELO 23: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 24: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 25: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 26: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 27: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar,acti=LIN);
MODELO 28: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=7,algo=levmar,acti=LIN);
*/

/* GRUPO 3
MODELO 29: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=levmar, acti=tanh);
MODELO 30:ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=8,algo=levmar, acti=tanh);
MODELO 31:ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=bprop mom=0.2,learn=0.1, acti=tanh);
MODELO 32: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=120,algo=bprop mom=0.2, learn=0.1, acti=tanh);
MODELO 33: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 34: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=120,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 35: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 36: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=120,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 37: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=levmar,acti=LIN);
MODELO 38: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=8,algo=levmar,acti=LIN);
*/

/* GRUPO 4
MODELO 39: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=,algo=levmar, acti=tanh);
MODELO 40:ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=9,algo=levmar, acti=tanh);
MODELO 41:ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=,algo=bprop mom=0.2,learn=0.1, acti=tanh);
MODELO 42: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=33,algo=bprop mom=0.2, learn=0.1, acti=tanh);
MODELO 43: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 44: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=33,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 45: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 46: ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=33,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 47: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=,algo=levmar,acti=LIN);
MODELO 48: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=9,algo=levmar,acti=LIN);
*/

/* GRUPOS 5, 6 y 7
MODELO 49: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=levmar, acti=tanh);
MODELO 50:ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar, acti=tanh);
MODELO 51:ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=bprop mom=0.2,learn=0.1, acti=tanh);
MODELO 52: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.2, learn=0.1, acti=tanh);
MODELO 53: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 54: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 55: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 56: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 57: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=,algo=levmar,acti=LIN);
MODELO 58: ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar,acti=LIN);
*/

/* GRUPO 8
MODELO 59: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=,algo=levmar, acti=tanh);
MODELO 60:ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=6,algo=levmar, acti=tanh);
MODELO 61:ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=,algo=bprop mom=0.2,learn=0.1, acti=tanh);
MODELO 62: ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=30,algo=bprop mom=0.2, learn=0.1, acti=tanh);
MODELO 63: ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 64: ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=30,algo=bprop mom=0.1, learn=0.2), acti=tanh);
MODELO 65: ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 66: ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=30,algo=bprop mom=0.3, learn=0.1), acti=tanh);
MODELO 67: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=,algo=levmar,acti=LIN);
MODELO 68: ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=6,algo=levmar,acti=LIN);
*/



/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/


%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12347,nodos=3,algo=levmar,early=500,acti=tanh);
data final9;set final;modelo=9;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12347,nodos=3,algo=levmar,early=5,acti=tanh);
data final10;set final;modelo=10;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final11;set final;modelo=11;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=5, algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final12;set final;modelo=12;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final13;set final;modelo=13;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=5,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final14;set final;modelo=14;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final15;set final;modelo=15;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=5,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final16;set final;modelo=16;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=500,algo=levmar,acti=LIN);
data final17;set final;modelo=17;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=5,algo=levmar,acti=LIN);
data final18;set final;modelo=18;


data union;set final9 final10 final11 final12 final13 final14 final15 final16 final17 final18;
proc boxplot data=union;plot media*modelo;run;

data union;set final9 final11 final13 final15 final16 final17;
proc boxplot data=union;plot media*modelo;run;

data union;set final10 final12 final14 final18;
proc boxplot data=union;plot media*modelo;run;


/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												
*/

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar, acti=tanh);
data final19;set final;modelo=19;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=7,algo=levmar, acti=tanh);
data final20;set final;modelo=20;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final21;set final;modelo=21;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final22;set final;modelo=22;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final23;set final;modelo=23;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final24;set final;modelo=24;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final25;set final;modelo=25;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final26;set final;modelo=26;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar,acti=LIN);
data final27;set final;modelo=27;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=7,algo=levmar,acti=LIN);
data final28;set final;modelo=28;


data union;set final19 final20 final21 final22 final23 final24 final25 final26 final27 final28;
proc boxplot data=union;plot media*modelo;run;


/* 
Tercer Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														

*/

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar, acti=tanh);
data final29;set final;modelo=29;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=8,algo=levmar, acti=tanh);
data final30;set final;modelo=30;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final31;set final;modelo=31;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=120,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final32;set final;modelo=32;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final33;set final;modelo=33;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=120,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final34;set final;modelo=34;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final35;set final;modelo=35;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=120,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final36;set final;modelo=36;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar,acti=LIN);
data final37;set final;modelo=37;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=8,algo=levmar,acti=LIN);
data final38;set final;modelo=38;


data union;set final29 final30 final31 final32 final33 final34 final35 final36 final37 final38;
proc boxplot data=union;plot media*modelo;run;

data union;set final29 final30 final37 final38;
proc boxplot data=union;plot media*modelo;run;


/* 
Cuarto Grupo:
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=500,algo=levmar, acti=tanh);
data final39;set final;modelo=39;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=9,algo=levmar, acti=tanh);
data final40;set final;modelo=40;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.1 learn=0.2,basura=c:\basura.txt);
data final41;set final;modelo=41;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=33,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final42;set final;modelo=42;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final43;set final;modelo=43;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=33,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final44;set final;modelo=44;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=500,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final45;set final;modelo=45;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=4,early=33,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final46;set final;modelo=46;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=500,algo=levmar,acti=LIN);
data final47;set final;modelo=47;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=9,algo=levmar,acti=LIN);
data final48;set final;modelo=48;


data union;set final39 final40 final41 final42 final43 final44 final45 final46 final47 final48;
proc boxplot data=union;plot media*modelo;run;

data union;set final39 final40;
proc boxplot data=union;plot media*modelo;run;


/* 
Quinto, sexto y septimo Grupo: 
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar, acti=tanh);
data final49;set final;modelo=49;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar, acti=tanh);
data final50;set final;modelo=50;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final51;set final;modelo=51;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final52;set final;modelo=52;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final53;set final;modelo=53;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final54;set final;modelo=54;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final55;set final;modelo=55;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=100,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final56;set final;modelo=56;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar,acti=LIN);
data final57;set final;modelo=57;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar,acti=LIN);
data final58;set final;modelo=58;

data union;set final49 final50 final51 final52 final53 final54 final55 final56 final57 final58;
proc boxplot data=union;plot media*modelo;run;

data union;set final49 final50 final56 final57 final58;
proc boxplot data=union;plot media*modelo;run;


/*
F. Sexto grupo cluster seleccion 2: Quinto grupo + Distancia_Mercados_y_ferias_cal1 + Cotidiano_alimentario	
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x	
*/          																																			

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar, acti=tanh);
data final59;set final;modelo=59;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar, acti=tanh);
data final60;set final;modelo=60;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar,acti=LIN);
data final61;set final;modelo=61;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar,acti=LIN);
data final62;set final;modelo=62;

data union;set final59 final60 final61 final62;
proc boxplot data=union;plot media*modelo;run;


/*
G. Septimo grupo cluster seleccion 3: Quinto grupo + Distancia_Mercados_y_ferias_cal1		
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	s	t	u	w	x																																		
*/

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar, acti=tanh);
data final63;set final;modelo=63;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar, acti=tanh);
data final64;set final;modelo=64;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=500,algo=levmar,acti=LIN);
data final65;set final;modelo=65;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=2,early=6,algo=levmar,acti=LIN);
data final66;set final;modelo=66;

data union;set final63 final64 final65 final66;
proc boxplot data=union;plot media*modelo;run;


/*
H. Octavo grupo restrictivo: Seleccion manual de variables segun grafico V de Cramer		
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=500,algo=levmar, acti=tanh);
data final67;set final;modelo=67;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=6,algo=levmar, acti=tanh);
data final68;set final;modelo=68;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=500,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final69;set final;modelo=69;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=30,algo=bprop mom=0.2 learn=0.1,basura=c:\basura.txt);
data final70;set final;modelo=70;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=500,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final71;set final;modelo=71;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=30,algo=bprop mom=0.8 learn=0.2,basura=c:\basura.txt);
data final72;set final;modelo=72;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=500,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final73;set final;modelo=73;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=7,early=30,algo=bprop mom=0.3 learn=0.1,basura=c:\basura.txt);
data final74;set final;modelo=74;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=500,algo=levmar,acti=LIN);
data final75;set final;modelo=75;

%cruzadabinarianeural(archivo=datos6,vardepen=b,
conti=aa ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
ngrupos=4,sinicio=12345,sfinal=12355,nodos=3,early=6,algo=levmar,acti=LIN);
data final76;set final;modelo=76;

data union;set final67 final68 final69 final70 final71 final72 final73 final74 final75 final76;
proc boxplot data=union;plot media*modelo;run;


/*
Mejores modelos Redes Neuronales Binarias
*/

data union;set final9 final20 final29 final39 final49 final59 final63 final67;
proc boxplot data=union;plot media*modelo;run;

data union;set final9 final29;
proc boxplot data=union;plot media*modelo;run;



/***********************************
MODELOS BAGGING (BOOTSTRAP AVERAGING)
************************************/

/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final77;set final;modelo=77;

data union;set final77 final78 final79;
proc boxplot data=union;plot media*modelo;run;


%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final78;set final;modelo=78;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final79;set final;modelo=79;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final80;set final;modelo=80;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final81;set final;modelo=81;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final82;set final;modelo=82;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final83;set final;modelo=83;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final84;set final;modelo=84;


data union;set final77 final78 final79 final80 final81 final82 final83 final84;
proc boxplot data=union;plot media*modelo;run;

data union;set final78 final80 final81 final83;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final85;set final;modelo=85;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final86;set final;modelo=86;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final87;set final;modelo=87;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final88;set final;modelo=88;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final89;set final;modelo=89;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final90;set final;modelo=90;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final91;set final;modelo=91;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final92;set final;modelo=92;


data union;set final85 final86 final87 final88 final89 final90 final91 final92;
proc boxplot data=union;plot media*modelo;run;

data union;set final86 final88 final89 final91;
proc boxplot data=union;plot media*modelo;run;


/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final93;set final;modelo=93;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final94;set final;modelo=94;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final95;set final;modelo=95;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final96;set final;modelo=96;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final97;set final;modelo=97;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final98;set final;modelo=98;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final99;set final;modelo=99;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final100;set final;modelo=100;


data union;set final93 final94 final95 final96 final97 final98 final99 final100;
proc boxplot data=union;plot media*modelo;run;

data union;set final94 final96 final97 final99;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final101;set final;modelo=101;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final102;set final;modelo=102;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final103;set final;modelo=103;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final104;set final;modelo=104;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final105;set final;modelo=105;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final106;set final;modelo=106;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final107;set final;modelo=107;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final108;set final;modelo=108;


data union;set final101 final102 final103 final104 final105 final106 final107 final108;
proc boxplot data=union;plot media*modelo;run;


/* 
Tercer grupo
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final109;set final;modelo=109;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final110;set final;modelo=110;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final111;set final;modelo=111;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final112;set final;modelo=112;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final113;set final;modelo=113;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final114;set final;modelo=114;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final115;set final;modelo=115;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final116;set final;modelo=116;


data union;set final109 final110 final111 final112 final113 final114 final115 final116;
proc boxplot data=union;plot media*modelo;run;



/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final117;set final;modelo=117;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final118;set final;modelo=118;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final119;set final;modelo=119;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final120;set final;modelo=120;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final121;set final;modelo=121;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final122;set final;modelo=122;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final123;set final;modelo=123;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al an	ax	bv	c	d	k	r	t	u	v	w	y,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final124;set final;modelo=124;


data union;set final117 final118 final119 final120 final121 final122 final123 final124;
proc boxplot data=union;plot media*modelo;run;


/* 
Cuarto grupo
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab    ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final125;set final;modelo=125;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final126;set final;modelo=126;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final127;set final;modelo=127;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final128;set final;modelo=128;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final129;set final;modelo=129;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final130;set final;modelo=130;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final131;set final;modelo=131;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final132;set final;modelo=132;


data union;set final125 final126 final127 final128 final129 final130 final131 final132;
proc boxplot data=union;plot media*modelo;run;



/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final133;set final;modelo=133;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final134;set final;modelo=134;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final135;set final;modelo=135;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final136;set final;modelo=136;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final137;set final;modelo=137;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final138;set final;modelo=138;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final139;set final;modelo=139;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final140;set final;modelo=140;


data union;set final133 final134 final135 final136 final137 final138 final139 final140;
proc boxplot data=union;plot media*modelo;run;


/* 
Quinto, sexto y septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final141;set final;modelo=141;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final142;set final;modelo=142;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final143;set final;modelo=143;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final144;set final;modelo=144;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final145;set final;modelo=145;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final146;set final;modelo=146;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final147;set final;modelo=147;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final148;set final;modelo=148;


data union;set final141 final142 final143 final144 final145 final146 final147 final148;
proc boxplot data=union;plot media*modelo;run;

data union;set final142 final144 final145 final147;
proc boxplot data=union;plot media*modelo;run;



/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final149;set final;modelo=149;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final150;set final;modelo=150;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final151;set final;modelo=151;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final152;set final;modelo=152;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final153;set final;modelo=153;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final154;set final;modelo=154;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final155;set final;modelo=155;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final156;set final;modelo=156;


data union;set final149 final150 final151 final152 final153 final154 final155 final156;
proc boxplot data=union;plot media*modelo;run;

data union;set final150 final152 final153 final155;
proc boxplot data=union;plot media*modelo;run;

data union;set final142 final144 final145 final147 final150 final152 final153 final155;
proc boxplot data=union;plot media*modelo;run;


/* 
Sexto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x																																			
*/


%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final157;set final;modelo=157;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final158;set final;modelo=158;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final159;set final;modelo=159;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final160;set final;modelo=160;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final161;set final;modelo=161;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final162;set final;modelo=162;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final163;set final;modelo=163;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final164;set final;modelo=164;

data union;set final157 final158 final159 final160 final161 final162 final163 final164;
proc boxplot data=union;plot media*modelo;run;


/* 
Séptimo Grupo: 
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	s	t	u	w	x																																		
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final165;set final;modelo=165;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final166;set final;modelo=166;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final167;set final;modelo=167;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final168;set final;modelo=168;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final169;set final;modelo=169;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final170;set final;modelo=170;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final171;set final;modelo=171;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final172;set final;modelo=172;


data union;set final165 final166 final167 final168 final169 final170 final171 final172;
proc boxplot data=union;plot media*modelo;run;


/* 
Octavo grupo
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/


%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final173;set final;modelo=173;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final174;set final;modelo=174;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final175;set final;modelo=175;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final176;set final;modelo=176;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final177;set final;modelo=177;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final178;set final;modelo=178;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final179;set final;modelo=179;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final180;set final;modelo=180;


data union;set final173 final174 final175 final176 final177 final178 final179 final180;
proc boxplot data=union;plot media*modelo;run;



/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final181;set final;modelo=181;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=5,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final182;set final;modelo=182;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final183;set final;modelo=183;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=10,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final184;set final;modelo=184;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final185;set final;modelo=185;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final186;set final;modelo=186;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final187;set final;modelo=187;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=52,porcenbag=0.80,maxbranch=4,tamhoja=20,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final188;set final;modelo=188;


data union;set final181 final182 final183 final184 final185 final186 final187 final188;
proc boxplot data=union;plot media*modelo;run;


/* Mejores modelos Bagging */

data union;set final78 final86 final99 final105 final112 final123 final131 final139 final144 final150 final159 final168 final176 final187;
proc boxplot data=union;plot media*modelo;run;

data union;set final168;
proc boxplot data=union;plot media*modelo;run;



/***********************************
RANDOM FOREST (BOOTSTRAP AVERAGING)
************************************/

/*
porcenbag=porcentaje de observaciones en cada iteración
variables=número de variables a sortear en cada nodo
tamhoja=tamaño minimo de hoja final
maxtrees=iteraciones
maxbranch=divisiones máximas en un nodo
maxdepth=máxima profundidad
pvalor=p-valor para las divisiones de nodos
*/



/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/



/* MODELOS VARIANDO UN POCO MAXDEPTH, TAMHOJA Y NUM VARIABLES*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final189;set final;modelo=189;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final190;set final;modelo=190;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final191;set final;modelo=191;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final192;set final;modelo=192;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final193;set final;modelo=193;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final194;set final;modelo=194;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final195;set final;modelo=195;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final196;set final;modelo=196;


data union;set final189 final190 final191 final192 final193 final194 final195 final196;
proc boxplot data=union;plot media*modelo;run;

data union;set final190 final192;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final197;set final;modelo=197;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final198;set final;modelo=198;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final199;set final;modelo=199;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final200;set final;modelo=200;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final201;set final;modelo=201;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final202;set final;modelo=202;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final203;set final;modelo=203;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final204;set final;modelo=204;

data union;set final197 final198 final199 final200 final201 final202 final203 final204;
proc boxplot data=union;plot media*modelo;run;

data union;set final198 final200;
proc boxplot data=union;plot media*modelo;run;


/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												
*/


/* MODELOS VARIANDO UN POCO MAXDEPTH, TAMHOJA Y NUM VARIABLES*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final205;set final;modelo=205;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final206;set final;modelo=206;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final207;set final;modelo=207;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final208;set final;modelo=208;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final209;set final;modelo=209;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final210;set final;modelo=210;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final211;set final;modelo=211;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final212;set final;modelo=212;


data union;set final205 final206 final207 final208 final209 final210 final211 final212;
proc boxplot data=union;plot media*modelo;run;

data union;set final190 final192;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final213;set final;modelo=213;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final214;set final;modelo=214;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final215;set final;modelo=215;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final216;set final;modelo=216;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final217;set final;modelo=217;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final218;set final;modelo=218;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final219;set final;modelo=219;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final220;set final;modelo=220;

data union;set final213 final214 final215 final216 final217 final218 final219 final220;
proc boxplot data=union;plot media*modelo;run;



/* 
Tercer grupo
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														
*/

/* MODELOS VARIANDO UN POCO MAXDEPTH, TAMHOJA Y NUM VARIABLES*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final221;set final;modelo=221;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final222;set final;modelo=222;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final223;set final;modelo=223;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final224;set final;modelo=224;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final225;set final;modelo=225;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final226;set final;modelo=226;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final227;set final;modelo=227;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final228;set final;modelo=228;


data union;set final221 final222 final223 final224 final225 final226 final227 final228;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final229;set final;modelo=229;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final230;set final;modelo=230;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final231;set final;modelo=231;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final232;set final;modelo=232;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final233;set final;modelo=233;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final234;set final;modelo=234;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final235;set final;modelo=235;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=al	an	ax	bv	c	d	k	r	t	u	v	w	y	,
categor=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final236;set final;modelo=236;

data union;set final229 final230 final231 final232 final233 final234 final235 final236;
proc boxplot data=union;plot media*modelo;run;

-----------------------------------

/* 
Cuarto grupo
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

/* MODELOS VARIANDO UN POCO MAXDEPTH, TAMHOJA Y NUM VARIABLES*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final237;set final;modelo=237;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final238;set final;modelo=238;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final239;set final;modelo=239;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final240;set final;modelo=240;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final241;set final;modelo=241;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final242;set final;modelo=242;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final243;set final;modelo=243;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final244;set final;modelo=244;


data union;set final237 final238 final239 final240 final241 final242 final243 final244;
proc boxplot data=union;plot media*modelo;run;

data union;set final190 final192;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final245;set final;modelo=245;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final246;set final;modelo=246;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final247;set final;modelo=247;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final248;set final;modelo=248;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final249;set final;modelo=249;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final250;set final;modelo=250;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final251;set final;modelo=251;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z	,
categor=ao	ar	as	at	au	av	aw	e	f	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final252;set final;modelo=252;

data union;set final245 final246 final247 final248 final249 final250 final251 final252;
proc boxplot data=union;plot media*modelo;run;

/* 
Quinto, sexto y septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

/* MODELOS VARIANDO UN POCO MAXDEPTH, TAMHOJA Y NUM VARIABLES*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final253;set final;modelo=253;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final254;set final;modelo=254;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final255;set final;modelo=255;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final256;set final;modelo=256;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final257;set final;modelo=257;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final258;set final;modelo=258;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final259;set final;modelo=259;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final260;set final;modelo=260;


data union;set final253 final254 final255 final256 final257 final258 final259 final260;
proc boxplot data=union;plot media*modelo;run;

data union;set final254 final255 final256 final257 final258 final259 final260;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final261;set final;modelo=261;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final262;set final;modelo=262;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final263;set final;modelo=263;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final264;set final;modelo=264;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final265;set final;modelo=265;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final266;set final;modelo=266;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final267;set final;modelo=267;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final268;set final;modelo=268;

data union;set final261 final262 final263 final264 final265 final266 final267 final268;
proc boxplot data=union;plot media*modelo;run;


/* 
Sexto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x																																			
*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final269;set final;modelo=269;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final270;set final;modelo=270;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final271;set final;modelo=271;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ag	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final272;set final;modelo=272;

data union;set final269 final270 final271 final272;
proc boxplot data=union;plot media*modelo;run;

/* 
Septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																							
Intervalo = ac	ai	an	d	s	t	u	w	x																																				
*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final273;set final;modelo=273;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final274;set final;modelo=274;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final275;set final;modelo=275;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=ac	ai	an	d	s	t	u	w	x,
categor=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final276;set final;modelo=276;

data union;set final273 final274 final275 final276;
proc boxplot data=union;plot media*modelo;run;


/* 
Octavo grupo
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/

/* MODELOS VARIANDO UN POCO MAXDEPTH, TAMHOJA Y NUM VARIABLES*/
%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final277;set final;modelo=277;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final278;set final;modelo=278;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final279;set final;modelo=279;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final280;set final;modelo=280;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final281;set final;modelo=281;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final282;set final;modelo=282;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final283;set final;modelo=283;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.1,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final284;set final;modelo=284;


data union;set final277 final278 final279 final280 final281 final282 final283 final284;
proc boxplot data=union;plot media*modelo;run;


/* Cambiamos el Pvalor*/

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final285;set final;modelo=285;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final286;set final;modelo=286;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final287;set final;modelo=287;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=8,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final288;set final;modelo=288;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final289;set final;modelo=289;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=7,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final290;set final;modelo=290;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=5,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final291;set final;modelo=291;

%cruzadarandomforestbin(
archivo=datos6,vardep=b,
conti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor=ar	as	at	au,
maxtrees=200,variables=17,porcenbag=0.80,maxbranch=4,tamhoja=15,maxdepth=10,pvalor=0.05,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final292;set final;modelo=292;

data union;set final285 final286 final287 final288 final289 final290 final291 final292;
proc boxplot data=union;plot media*modelo;run;


/* Mejores modelos RF */

data union;set final192 final198 final208 final216 final224 final232 final240 final248 final254 final262 final269 final273 final278 final288;
proc boxplot data=union;plot media*modelo;run;


/***********************************
GRADIENT BOOSTING
************************************/

/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.001,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final293;set final;modelo=293;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final294;set final;modelo=294;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=200,shrink=0.05,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final295;set final;modelo=295;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=100,shrink=0.1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final296;set final;modelo=296;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=50,shrink=1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final297;set final;modelo=297;

data union;set final293 final294 final295 final296 final297;
proc boxplot data=union;plot media*modelo;run;


ELEGIMOS EL MODELO 294

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final298;set final;modelo=298;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=200,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final299;set final;modelo=299;

data union;set final294 final298 final299;
proc boxplot data=union;plot media*modelo;run;

elegimos el modelo 298

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final300;set final;modelo=300;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final301;set final;modelo=301;   

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=6,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final302;set final;modelo=302;

data union;set final298 final300 final301 final302;
proc boxplot data=union;plot media*modelo;run;

elegimos el modelo 301

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=10,minobs=15,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final303;set final;modelo=303;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
categor=ao	ar	as	at	au	av	aw	e	f	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=20,minobs=25,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final304;set final;modelo=304;

data union;set final301 final303 final304;
proc boxplot data=union;plot media*modelo;run;


/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.001,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final305;set final;modelo=305;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final306;set final;modelo=306;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=200,shrink=0.05,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final307;set final;modelo=307;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=100,shrink=0.1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final38;set final;modelo=308;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=50,shrink=1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final309;set final;modelo=309;

data union;set final305 final306 final307 final38 final309;
proc boxplot data=union;plot media*modelo;run;

Mejor Modelo: 306

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=200,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final310;set final;modelo=310;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final311;set final;modelo=311;

data union;set final306 final310 final311;
proc boxplot data=union;plot media*modelo;run;

elegimos el 311

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final312;set final;modelo=312;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final313;set final;modelo=313;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=6,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final314;set final;modelo=314;

data union;set final311 final312 final313 final314;
proc boxplot data=union;plot media*modelo;run;

/* 
Tercer grupo
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.001,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final315;set final;modelo=315;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final316;set final;modelo=316;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=200,shrink=0.05,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final317;set final;modelo=317;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=100,shrink=0.1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final318;set final;modelo=318;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=50,shrink=1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final319;set final;modelo=319;

data union;set final315 final316 final317 final318 final319;
proc boxplot data=union;plot media*modelo;run;

Modelo 316

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=200,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final320;set final;modelo=320;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final321;set final;modelo=321;

data union;set final316 final320 final321;
proc boxplot data=union;plot media*modelo;run;

elegimos el 321

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=2,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final322;set final;modelo=322;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final323;set final;modelo=323;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final324;set final;modelo=324;

data union;set final321 final322 final323 final324;
proc boxplot data=union;plot media*modelo;run;


PROC MEANS DATA=auto;
  WHERE rep78 = 3 or rep78 = 4 or rep78 = 5 ; 
  VAR price ;
RUN;   


/* 
Cuarto grupo
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=400,shrink=0.001,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final325;set final;modelo=325;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final326;set final;modelo=326;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=200,shrink=0.05,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final327;set final;modelo=327;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=100,shrink=0.1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final328;set final;modelo=328;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=50,shrink=1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final329;set final;modelo=329;

data union;set final325 final326 final327 final328 final329;
proc boxplot data=union;plot media*modelo;run;

elegimos el 326

/* grupo 4 */
%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=200,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final330;set final;modelo=330;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final331;set final;modelo=331;

data union;set final326 final330 final331;
proc boxplot data=union;plot media*modelo;run;

331

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final331;set final;modelo=331;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final332;set final;modelo=332;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final333;set final;modelo=333;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
categor= ao	ar	as	at	au	av	aw	e	f	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=6,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final334;set final;modelo=334;

data union;set final331 final332 final333 final334;
proc boxplot data=union;plot media*modelo;run;


/* 
Quinto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=400,shrink=0.001,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final335;set final;modelo=335;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final336;set final;modelo=336;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=200,shrink=0.05,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final337;set final;modelo=337;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=100,shrink=0.1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final338;set final;modelo=338;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=50,shrink=1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final339;set final;modelo=339;

data union;set final335 final336 final337 final338 final339;
proc boxplot data=union;plot media*modelo;run;

336

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=200,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final340;set final;modelo=340;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final341;set final;modelo=341;

data union;set final336 final340 final341;
proc boxplot data=union;plot media*modelo;run;

336

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final336;set final;modelo=336;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final342;set final;modelo=342;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final343;set final;modelo=343;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=6,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final344;set final;modelo=344;

data union;set final336 final342 final343 final344;
proc boxplot data=union;plot media*modelo;run;


/* 
Sexto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x																																			
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ag	ai	an	d	s	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final345;set final;modelo=345;


/* 
Septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																							
Intervalo = ac	ai	an	d	s	t	u	w	x																																				
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= ac	ai	an	d	s	t	u	w	x,
categor= ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final346;set final;modelo=346;

data union;set final342 final345 final346;
proc boxplot data=union;plot media*modelo;run;


/* 
Octavo grupo
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=400,shrink=0.001,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final347;set final;modelo=347;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final348;set final;modelo=348;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=200,shrink=0.05,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final349;set final;modelo=349;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=100,shrink=0.1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final350;set final;modelo=350;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=50,shrink=1,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final351;set final;modelo=351;

data union;set final347 final348 final349 final350 final351;
proc boxplot data=union;plot media*modelo;run;

348

/* grupo 8 */
%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=200,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final352;set final;modelo=352;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final353;set final;modelo=353;

data union;set final348 final352 final353;
proc boxplot data=union;plot media*modelo;run;

348

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=5,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final348;set final;modelo=348;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=3,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final354;set final;modelo=354;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final355;set final;modelo=355;

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
categor= ar	as	at	au,
leafsize=7,iteraciones=300,shrink=0.01,maxbranch=4,maxdepth=6,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final356;set final;modelo=356;

data union;set final348 final354 final355 final356;
proc boxplot data=union;plot media*modelo;run;



desde aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

/* Mejores modelos Gradient Boosting */

%cruzadatreeboostbin(archivo=datos6,vardepen=b,
conti= al	an	ax	bv	c	d	k	r	t	u	v	w	y,
categor= as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
leafsize=15,iteraciones=400,shrink=0.01,maxbranch=4,maxdepth=4,mincatsize=15,minobs=20,
ngrupos=4,sinicio=13345,sfinal=13350,objetivo=tasafallos);
data final324;set final;modelo=324;

data union;set final301 final313 final324 final332 final342 final355;
proc boxplot data=union;plot media*modelo;run;



/***********************************
SUPPORT VECTOR MACHINE
************************************/

/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/


/* Lineal C 0.001, 0.01, 0.05, 0.1, 0.2, 0.5, 1, 2, 5, 10 y 100*/ 

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.001,directorio=c:,degree=2,k_par=1);
data final356;set final;modelo=356;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final357;set final;modelo=357;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.05,directorio=c:,degree=2,k_par=1);
data final358;set final;modelo=358;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.1,directorio=c:,degree=2,k_par=1);
data final359;set final;modelo=359;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.2,directorio=c:,degree=2,k_par=1);
data final360;set final;modelo=360;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.5,directorio=c:,degree=2,k_par=1);
data final361;set final;modelo=361;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=1,directorio=c:,degree=2,k_par=1);
data final362;set final;modelo=362;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=2,directorio=c:,degree=2,k_par=1);
data final363;set final;modelo=363;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
grupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=5,directorio=c:,degree=2,k_par=1);
data final364;set final;modelo=364;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=10,directorio=c:,degree=2,k_par=1);
data final365;set final;modelo=365;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=100,directorio=c:,degree=2,k_par=1);
data final366;set final;modelo=366;

data union;set final356 final357 final358 final359 final360 final361 final362 final363 final364 final365 final366;
proc boxplot data=union;plot media*modelo;run;


/* Polinomial degree=c(2,3) C 0.001, 0.01, 0.05, 0.1, 0.2, 0.5 */ 

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=2,k_par=1);
data final367;set final;modelo=367;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.01,directorio=c:,degree=2,k_par=1);
data final368;set final;modelo=368;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.05,directorio=c:,degree=2,k_par=1);
data final369;set final;modelo=369;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.1,directorio=c:,degree=2,k_par=1);
data final370;set final;modelo=370;

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.5,directorio=c:,degree=2,k_par=1);
data final371;set final;modelo=371;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final372;set final;modelo=372;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.01,directorio=c:,degree=3,k_par=1);
data final373;set final;modelo=373;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.05,directorio=c:,degree=3,k_par=1);
data final374;set final;modelo=374;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.1,directorio=c:,degree=3,k_par=1);
data final375;set final;modelo=375;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.5,directorio=c:,degree=3,k_par=1);
data final376;set final;modelo=376;

data union;set final367 final368 final369 final370 final371 final372 final373 final374 final375 final376;
proc boxplot data=union;plot media*modelo;run;


/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel=RBF,c=0.01,directorio=c:,degree=2,k_par=0.01);
data final383;set final;modelo=383;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel=RBF,c=0.1,directorio=c:,degree=2,k_par=0.01);
data final384;set final;modelo=384;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel=RBF,c=1,directorio=c:,degree=2,k_par=0.01);
data final385;set final;modelo=385;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel=RBF,c=10,directorio=c:,degree=2,k_par=0.01);
data final386;set final;modelo=386;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel=RBF,c=1,directorio=c:,degree=3,k_par=0.01);
data final387;set final;modelo=387;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final388;set final;modelo=388;

data union;set final383 final384 final385 final386 final387 final388;
proc boxplot data=union;plot media*modelo;run;

data union;set final383 final384 final385 final386 final387 final388;
proc boxplot data=union;plot media*modelo;run;



/* 
Comparacion mejores SVM
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final357;set final;modelo=357;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final372;set final;modelo=372;

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final388;set final;modelo=388;

/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												
*/

/* Lineal */ 

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final389;set final;modelo=389;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final390;set final;modelo=390;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final391;set final;modelo=391;

/* 
Tercer grupo
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final392;set final;modelo=392;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final393;set final;modelo=393;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g,
listconti=al	an	ax	bv	c	d	k	r	t	u	v	w	y,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final394;set final;modelo=394;

/* 
Cuarto grupo
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final395;set final;modelo=395;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final396;set final;modelo=396;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ao	ar	as	at	au	av	aw	e	f	g,
listconti=ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final397;set final;modelo=397;

/* 
Quinto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final398;set final;modelo=398;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final399;set final;modelo=399;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final400;set final;modelo=400;

/* 
Sexto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x																																			
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ag	ai	an	d	s	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final401;set final;modelo=401;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ag	ai	an	d	s	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final402;set final;modelo=402;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ag	ai	an	d	s	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final403;set final;modelo=403;

/* 
Septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																							
Intervalo = ac	ai	an	d	s	t	u	w	x																																				
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	s	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final404;set final;modelo=404;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	s	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final405;set final;modelo=405;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g,
listconti=ac	ai	an	d	s	t	u	w	x,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final406;set final;modelo=406;

/* 
Octavo grupo
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/

%cruzadaSVMbin(archivo=datos6,
vardepen=b,listclass=ar	as	at	au,
listconti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=lineal,c=0.01,directorio=c:,degree=2,k_par=1);
data final407;set final;modelo=407;

/* Polinomial degree=c(2,3) */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	at	au,
listconti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
ngrupos=5,sinicio=22345,sfinal=22355,kernel=polynom,c=0.001,directorio=c:,degree=3,k_par=1);
data final408;set final;modelo=408;

/*RBF */ 

%cruzadaSVMbin(archivo=datos7,
vardepen=b,listclass=ar	as	at	au,
listconti=aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y,
ngrupos=5,sinicio=22345,sfinal=22350,kernel= RBF,c=10,directorio=c:,degree=3,k_par=0.01);
data final409;set final;modelo=409;


data union;set final357 final372 final388 final389 final390 final391 final392 final393 final394 final395 final396 final397 final398 final399 final400 final401 final402 final403 final404 final405 final406 final407 final408 final409;
proc boxplot data=union;plot media*modelo;run;


/**************************
COMPARACION MEJORES MODELOS
***************************/

data union;set final3 final29 final168 final198 final301 final408;
proc boxplot data=union;plot media*modelo;run;

data union;set final29 final301;
proc boxplot data=union;plot media*modelo;run;



/************************/
/*TECNICAS DE ENSAMBLADO*/
/************************/

/*CON PRIMER GRUPO DE VARIABLES
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/


/* CON SVM SE PONE KERNEL= COMO EN LA MACRO SVM*/
options mprint source notes;
%cruzadastack(archivo=datos7,
vardepen=b,listclass= ao	ar	as	at	au	av	aw	e	f	g,
listconti=aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z,
nodos=2,algo=levmar,rediter=,/*parametros red*/
maxtrees=200,vars_to_try=8,trainfraction=0.8,leafsize=7,maxdepth=5,/*random forest*/
bleafsize=7,iterations=400,bmaxbranch=4,bmaxdepth=4,shrinkage=0.01,/*g boosting*/
kernel=linear,c=0.01,/*SVM polinomial*/
ngrupos=4,seminicio=12345,semifinal=12356);

proc print data=sal3;run;

/* CORRELACIONES ENTRE PREDICCIONES PUNTUALES ULTIMA SEMILLA Y GRUPO*/
proc corr data=salfin;var predi1-predi5;run;



/* EJEMPLO CON SVM */

/*PREPARACION GRAFICO Y ETIQUETAS */

data cajas;
array ase{23};
set final;
do i=1 to 23;
modelo=i;
error=ase{i};
output;
end;
run;

/* EN ESTAS OPCIONES SE CAMBIA LA LETRA Y LA ALTURA DEL TEXTO EN LOS EJES CON HTEXT.
options font="Courier New" bold 8;
run;goptions htext=8pt;
*/

proc sort data=cajas;by modelo;
data eti;length eti $ 13;
input modelo eti $;
cards;
1 RED
2 LOG
3 RFOR
4 BOOST
5 SVM
6 RLOG
7 REDFOR
8 REDBOO
9 LRFOR
10 LBOOST
11 RFORBOO
12 R-L-RFOR
13 R-L-BOO
14 R-RF-BOO
15 L-RF-BOO
16 R-L-RF-BOO
17 15ponde
18 R-SVM
19 RF-SVM
20 L-SVM
21 BOO-SVM
22 SVMLRF
23 RLRFBSVM
;
data cajas2;merge cajas eti;by modelo;
title1 
h=2 box=1 j=c c=red 'TRAMO PELIGROSO' j=c ; 

options font="Courier New" bold 8;
run;goptions htext=5pt;

ods graphics off;

proc boxplot data=cajas2;plot error*ETI /
cboxes        = dagr
cboxfill      = ywh;
/* vaxis=0.20 to 0.35 by 0.01 */
;run;


/*Solo los mejores modelos*/
proc sort data=cajas;by modelo;
data eti;length eti $ 13;
input modelo eti $;
cards;
7 REDFOR
9 LRFOR
17 15ponde
;
data cajas2;merge cajas eti;by modelo;
title1 
h=2 box=1 j=c c=red 'TRAMO PELIGROSO' j=c ; 

options font="Courier New" bold 8;
run;goptions htext=5pt;

ods graphics off;

proc boxplot data=cajas2;plot error*ETI /
cboxes        = dagr
cboxfill      = ywh;
/* vaxis=0.20 to 0.35 by 0.01 */
;run;


PROC MEANS DATA=final301;
RUN;

/* 
Primer Grupo: 
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = aa	ab	ac	ad	ae	af	ag	ah	ai	aj	ak	al	am	an	ap	ax	ay	az	ba	bb	bc	bd	d	h	i	j	k	l	m	n	o	p	q	r	s	t	u	v	w	x	y	z	
*/

/* 
Segundo Grupo: 
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	ca	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g														
Intervalo = ag	aj	al	am	bv	c	d	k	n	r	t	u	v	w	y																												
*/

/* 
Tercer grupo
Clase = as	at	au	bf	bj	bk	bl	bm	bn	bp	br	bt	bw	by	bz	cb	cc	cf	cg	cj	ck	cl	cn	co	cq	cr	ct	g															
Intervalo = al	an	ax	bv	c	d	k	r	t	u	v	w	y																														
*/

/* 
Cuarto grupo
Clase = ao	ar	as	at	au	av	aw	e	f	g																																	
Intervalo = ab	ac	ad	ae	af	ag	ai	aj	ak	an	ax	ay	ba	bb	bd	c	d	h	i	s	t	u	w	x	z																		
*/

/* 
Quinto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ai	an	d	t	u	w	x																																			
*/

/* 
Sexto grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																						
Intervalo = ac	ag	ai	an	d	s	t	u	w	x																																			
*/

/* 
Septimo grupo
Clase = ar	as	aw	bf	bj	bk	bl	bp	bq	bt	by	cb	cc	cf	cg	cj	cl	cn	co	ct	g																							
Intervalo = ac	ai	an	d	s	t	u	w	x																																				
*/

/* 
Octavo grupo
Clase = ar	as	at	au																																							
Intervalo = aa	ab	ac	af	ak	bc	bd	h	j	k	l	r	s	w	x	y																											
*/




