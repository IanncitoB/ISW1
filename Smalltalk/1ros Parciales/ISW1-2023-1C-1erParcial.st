!classDefinition: #TestDePerforación category: #'ISW1-2023-1C-Parcial-1'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:59:48'!
calcularProfundidadHastaPrimerCapaDeTipo: unSuelo debeDar: unaProfundidad

	| excavadora |
	excavadora := self setupExcavadoraParaCalculosDeProfundidadYCapas.
	
	self assert: unaProfundidad equals: (excavadora calcularProfundidadDelSueloHasta: unSuelo).! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:59:20'!
contarLasCapasDeTipo: unSuelo debeDar: unaCantidadDeCapas

	| excavadora |
	excavadora := self setupExcavadoraParaCalculosDeProfundidadYCapas.
	
	self assert: unaCantidadDeCapas equals: (excavadora contarCapas: unSuelo).

	! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 22:07:42'!
setupExcavadoraConSuelo: unSueloAExcavar conMecha: unaMecha yEjecuta: unBloque

	| excavadora |
	
	excavadora := Perforadora sobreSuelo: unSueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:53'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:58'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:52'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:45'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:00'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:43'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:48'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 4/27/2023 21:54:59'!
test10CuandoRemueveLaCapaYHayPiedrasLasRecolectaEnSuContainer

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			'Mica'.
			'Marmol'
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: {	'Mica'. 'Marmol'} equals: excavadora elementsInContainer
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'HAW 5/3/2023 22:34:18'!
test11CuandoRemueveLaCapaYNoHayNadaNoRecogeNada

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: excavadora elementsInContainer isEmpty
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:09'!
test12NoPuedePerforarSinMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
		
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No puede perforar' equals: unError messageText.
			self assert: (CapaDeSuelo arenoso) equals: excavadora capaDeSueloInmediata ].	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 12:53:38'!
test13PuedeCalcularProfundidadDelSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenosoConAltura: 2. CapaDeSuelo tierraConAltura: 40. CapaDeSuelo arenoso} .
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 42 equals: excavadora calcularProfundidadDelSuelo.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:41:49'!
test14PuedeContarLasCapasDeTipoArenoso
	
	self contarLasCapasDeTipo: CapaDeSuelo arenoso debeDar: 2.
	

	! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:42:20'!
test15PuedeContarLasCapasDeTipoTierra
	
	self contarLasCapasDeTipo: CapaDeSuelo tierra debeDar: 1.
	! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:42:53'!
test16PuedeContarLasCapasDeTipoConcreto

	self contarLasCapasDeTipo: (CapaDeSuelo concretoConResistencia: 10) debeDar: 1.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:48:28'!
test17PuedeCalcularProfundidadHastaPrimerCapaDeTipoArenoso

	self calcularProfundidadHastaPrimerCapaDeTipo: CapaDeSuelo arenoso debeDar: 0.
! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:48:47'!
test18PuedeCalcularProfundidadHastaPrimerCapaDeTipoTierra
	
	self calcularProfundidadHastaPrimerCapaDeTipo: CapaDeSuelo tierra debeDar: 2.! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 21:49:21'!
test19PuedeCalcularProfundidadHastaPrimerCapaDeTipoConcreto

	self calcularProfundidadHastaPrimerCapaDeTipo: (CapaDeSuelo concretoConResistencia: 10) debeDar: 42.! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 17:06:32'!
test20CrearUnaPerforadoraConCapasContiguasIgualesDaError

	| sueloAExcavar |
	
	sueloAExcavar := {  CapaDeSuelo arenosoConAltura: 2.
					CapaDeSuelo arenosoConAltura: 8.}.
		
	self should: [Perforadora sobreSuelo: sueloAExcavar.]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No se aceptan dos capas contiguas del mismo tipo.' equals: unError messageText.
			].! !

!TestDePerforación methodsFor: 'test' stamp: 'IB 4/27/2024 17:39:34'!
test21CrearUnaPerforadoraConCapasContiguasDeConcretoConDiferenteDurezaNoDaError

	| sueloAExcavar |
	
	sueloAExcavar := {  CapaDeSuelo concretoConResistencia: 10 conAltura: 5.
					CapaDeSuelo concretoConResistencia: 20 conAltura: 5}.
	
	Perforadora sobreSuelo: sueloAExcavar.! !


!TestDePerforación methodsFor: 'setUp/tearDown' stamp: 'IB 4/27/2024 21:58:25'!
setupExcavadoraParaCalculosDeProfundidadYCapas

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenosoConAltura: 2. CapaDeSuelo tierraConAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	^ excavadora.

	! !


!classDefinition: #CapaDeSuelo category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: 'resistencia altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSuelo methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:56:19'!
esArenoso

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:56:32'!
esConcreto

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:56:40'!
esTierra

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:10:44'!
= unaCapaDeSuelo

	self subclassResponsibility! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:10:51'!
hash

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
sinResistencia
	^resistencia = 0! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'FRT 5/5/2023 16:48:52'!
altura

	^ altura.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 5/8/2023 13:10:35'!
resistencia

	^ resistencia.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'IB 4/26/2024 11:58:35'!
tipo

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'scan' stamp: 'IB 4/26/2024 11:59:28'!
scan

	self subclassResponsibility! !


!CapaDeSuelo methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 12:48:23'!
darGolpeDeTaladroConPerforadora: unaPerforadora

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 12:42:46'!
arenoso

	^self arenosoConAltura: 0.! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 12:40:41'!
arenosoConAltura: unaAltura

	^CapaDeSueloDeArena basicNew initializeConAltura: unaAltura.! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 12:45:41'!
concretoConResistencia: resistencia 

	^self concretoConResistencia: resistencia conAltura: 0.! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 12:46:03'!
concretoConResistencia: resistencia conAltura: unaAltura

	^CapaDeSueloDeConcreto basicNew initializeConResistencia: resistencia conAltura: unaAltura.! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 12:47:54'!
tierra

	^self tierraConAltura: 0.! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 12:47:32'!
tierraConAltura: unaAltura

	^CapaDeSueloDeTierra basicNew initializeConAltura: unaAltura.! !


!classDefinition: #CapaDeSueloDeArena category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #CapaDeSueloDeArena
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSueloDeArena methodsFor: 'initialization' stamp: 'IB 4/27/2024 12:39:48'!
initializeConAltura: unaAltura
	altura := unaAltura.! !


!CapaDeSueloDeArena methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:56:49'!
esArenoso
	^true! !

!CapaDeSueloDeArena methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:56:54'!
esConcreto
	^false! !

!CapaDeSueloDeArena methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:56:58'!
esTierra
	^false! !


!CapaDeSueloDeArena methodsFor: 'accessing' stamp: 'IB 4/26/2024 12:11:59'!
tipo

	^self name withoutPrefix: 'CapaDeSueloDe'! !


!CapaDeSueloDeArena methodsFor: 'scan' stamp: 'IB 4/26/2024 11:59:39'!
scan

	^7! !


!CapaDeSueloDeArena methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:13:51'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [resistencia = unaCapaDeSuelo resistencia]! !

!CapaDeSueloDeArena methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:13:15'!
hash

	^self tipo hash + resistencia hash! !


!CapaDeSueloDeArena methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 12:49:50'!
darGolpeDeTaladroConPerforadora: unaPerforadora
	
	unaPerforadora darGolpeDeTaladroCuandoCapaInmediataEsArena! !


!classDefinition: #CapaDeSueloDeConcreto category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #CapaDeSueloDeConcreto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSueloDeConcreto methodsFor: 'initialization' stamp: 'IB 4/27/2024 12:46:25'!
initializeConResistencia: resistenciaInicial conAltura: unaAltura

	resistencia := resistenciaInicial.
	altura := unaAltura.! !


!CapaDeSueloDeConcreto methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:57:03'!
esArenoso
	^false! !

!CapaDeSueloDeConcreto methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:57:10'!
esConcreto
	^true! !

!CapaDeSueloDeConcreto methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:57:13'!
esTierra
	^false! !


!CapaDeSueloDeConcreto methodsFor: 'accessing' stamp: 'IB 4/26/2024 12:12:14'!
tipo

	^self name withoutPrefix: 'CapaDeSueloDe'! !


!CapaDeSueloDeConcreto methodsFor: 'scan' stamp: 'IB 4/26/2024 11:59:47'!
scan
	^ 50. ! !


!CapaDeSueloDeConcreto methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:13:55'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [resistencia = unaCapaDeSuelo resistencia]! !

!CapaDeSueloDeConcreto methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:13:02'!
hash

	^self tipo hash + resistencia hash! !


!CapaDeSueloDeConcreto methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 12:50:06'!
darGolpeDeTaladroConPerforadora: unaPerforadora
	
	unaPerforadora darGolpeDeTaladroCuandoCapaInmediataEsConcreto! !


!classDefinition: #CapaDeSueloDeTierra category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #CapaDeSueloDeTierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSueloDeTierra methodsFor: 'initialization' stamp: 'IB 4/27/2024 12:46:46'!
initializeConAltura: unaAltura
	altura := unaAltura.! !


!CapaDeSueloDeTierra methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:57:22'!
esArenoso
	^false! !

!CapaDeSueloDeTierra methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:57:25'!
esConcreto
	^false! !

!CapaDeSueloDeTierra methodsFor: 'tipo' stamp: 'IB 4/26/2024 11:57:29'!
esTierra
	^true! !


!CapaDeSueloDeTierra methodsFor: 'accessing' stamp: 'IB 4/26/2024 12:12:23'!
tipo

	^self name withoutPrefix: 'CapaDeSueloDe'! !


!CapaDeSueloDeTierra methodsFor: 'scan' stamp: 'IB 4/26/2024 12:00:04'!
scan
	^10! !


!CapaDeSueloDeTierra methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:14:00'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [resistencia = unaCapaDeSuelo resistencia]! !

!CapaDeSueloDeTierra methodsFor: 'comparing' stamp: 'IB 4/26/2024 12:12:48'!
hash

	^self tipo hash + resistencia hash! !


!CapaDeSueloDeTierra methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 12:50:24'!
darGolpeDeTaladroConPerforadora: unaPerforadora
	
	unaPerforadora darGolpeDeTaladroCuandoCapaInmediataEsTierra! !


!classDefinition: #Perforadora category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #Perforadora
	instanceVariableNames: 'tipoDeSuelo mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'IB 4/26/2024 13:33:53'!
conMechaRota

	^mechaPuesta = MechaRota! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:12:20'!
elementsInContainer
	^container asArray! !

!Perforadora methodsFor: 'accessing' stamp: 'IB 4/26/2024 12:34:24'!
sinMecha

	^mechaPuesta = SinMecha! !


!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 5/1/2023 20:07:29'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self]. 
	(capasDeSueloDebajo first isKindOf: CapaDeSuelo) ifFalse:[
			container addAll: capasDeSueloDebajo.
		]! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 4/27/2023 20:46:30'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'IB 4/26/2024 13:32:53'!
ponerMechaDiamante
	mechaPuesta := MechaDeDiamante new! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'IB 4/26/2024 13:33:36'!
ponerMechaSoft
	mechaPuesta := MechaDeSoft new! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'IB 4/26/2024 13:33:24'!
ponerMechaWidia
	mechaPuesta := MechaDeWidia new! !


!Perforadora methodsFor: 'excavation' stamp: 'IB 4/26/2024 13:28:13'!
darGolpeDeTaladro
	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	self capaDeSueloInmediata darGolpeDeTaladroConPerforadora: self! !

!Perforadora methodsFor: 'excavation' stamp: 'IB 4/26/2024 13:21:36'!
darGolpeDeTaladroCuandoCapaInmediataEsArena
	mechaPuesta darGolpeDeTaladroSobreArenaConPerforadora: self! !

!Perforadora methodsFor: 'excavation' stamp: 'IB 4/26/2024 13:21:33'!
darGolpeDeTaladroCuandoCapaInmediataEsConcreto
	mechaPuesta darGolpeDeTaladroSobreConcretoConPerforadora: self! !

!Perforadora methodsFor: 'excavation' stamp: 'IB 4/26/2024 13:21:30'!
darGolpeDeTaladroCuandoCapaInmediataEsTierra
	mechaPuesta darGolpeDeTaladroSobreTierraConPerforadora: self! !

!Perforadora methodsFor: 'excavation' stamp: 'IB 4/26/2024 13:35:53'!
darGolpeDeTaladroCuandoMechaRota
	self error: 'No puede perforar'! !

!Perforadora methodsFor: 'excavation' stamp: 'IB 4/26/2024 15:12:10'!
darGolpeDeTaladroCuandoSinMecha
	self error: 'No puede perforar'
	"En un principio se comportaría igual"! !


!Perforadora methodsFor: 'excavationArena' stamp: 'IB 4/26/2024 13:33:53'!
darGolpeDeTaladroSobreArenaConMechaDiamante
	mechaPuesta := MechaRota.
	self error: 'Se rompió'! !

!Perforadora methodsFor: 'excavationArena' stamp: 'IB 4/26/2024 13:15:20'!
darGolpeDeTaladroSobreArenaConMechaSoft
	^self pasarAProximaCapa! !

!Perforadora methodsFor: 'excavationArena' stamp: 'IB 4/26/2024 13:15:12'!
darGolpeDeTaladroSobreArenaConMechaWidia
	^self pasarAProximaCapa! !


!Perforadora methodsFor: 'excavationConcreto' stamp: 'IB 4/26/2024 13:18:52'!
darGolpeDeTaladroSobreConcretoConMechaDiamante
	vecesQueGolpeoCapaActual even 
		ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
	
	capasDeSueloDebajo first sinResistencia 
		ifTrue: [ ^self transformarCapaEnArenoso].
	
	^vecesQueGolpeoCapaActual! !

!Perforadora methodsFor: 'excavationConcreto' stamp: 'IB 4/26/2024 13:33:53'!
darGolpeDeTaladroSobreConcretoConMechaSoft
	mechaPuesta := MechaRota.
	self error: 'Se rompió'.! !

!Perforadora methodsFor: 'excavationConcreto' stamp: 'IB 4/26/2024 13:33:53'!
darGolpeDeTaladroSobreConcretoConMechaWidia
	vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := MechaRota. self error: 'Se rompió' ].! !


!Perforadora methodsFor: 'excavationTierra' stamp: 'IB 4/26/2024 13:13:06'!
darGolpeDeTaladroSobreTierraConMechaDiamante
	self pasarAProximaCapa! !

!Perforadora methodsFor: 'excavationTierra' stamp: 'IB 4/26/2024 13:13:10'!
darGolpeDeTaladroSobreTierraConMechaSoft
	! !

!Perforadora methodsFor: 'excavationTierra' stamp: 'IB 4/26/2024 13:13:02'!
darGolpeDeTaladroSobreTierraConMechaWidia
	vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].! !


!Perforadora methodsFor: 'initialization' stamp: 'IB 4/26/2024 13:22:45'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	container := OrderedCollection new.
	mechaPuesta := SinMecha new! !


!Perforadora methodsFor: 'scan' stamp: 'IB 4/27/2024 13:15:55'!
calcularProfundidadDelSuelo
	^capasDeSueloDebajo sum: [:capa | capa altura	].! !

!Perforadora methodsFor: 'scan' stamp: 'IB 4/27/2024 16:30:53'!
calcularProfundidadDelSueloHasta: tipoDeCapa
	
	^ capasDeSueloDebajo 
		inject:0
		into: [ :total :capa |
			capa scan = tipoDeCapa scan ifTrue: [^total].
			total + capa altura
			].! !

!Perforadora methodsFor: 'scan' stamp: 'IB 4/27/2024 16:32:08'!
contarCapas: tipoDeCapa
	
	"Cuenta las capas de tipo tipoDeCapa. Recordar que para identificar cada capa se utiliza el valor de scan que retorna. Por ej. un capa tipo Arenoso retorna 7 al scan"
	
	^capasDeSueloDebajo count: [:capa | (capa scan = tipoDeCapa scan)].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-2023-1C-Parcial-1'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'error handling' stamp: 'IB 4/27/2024 16:54:54'!
capasContiguasDelMismoTipoError

	^ self error: 'No se aceptan dos capas contiguas del mismo tipo.'! !


!Perforadora class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 17:09:08'!
assertNoHayCapasContiguasDelMismoTipo: capasDeSueloAExcavar

	^ capasDeSueloAExcavar withNextDo: [:capa : capaSiguiente |
		capa = capaSiguiente ifTrue:[self capasContiguasDelMismoTipoError]]! !

!Perforadora class methodsFor: 'instance creation' stamp: 'IB 4/27/2024 17:08:57'!
sobreSuelo: capasDeSueloAExcavar 
	
	self assertNoHayCapasContiguasDelMismoTipo: capasDeSueloAExcavar.

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !


!classDefinition: #TipoDeMecha category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #TipoDeMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!TipoDeMecha methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:01:42'!
darGolpeDeTaladroSobreArenaConPerforadora: unaPerforadora

	self subclassResponsibility! !

!TipoDeMecha methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:06:41'!
darGolpeDeTaladroSobreConcretoConPerforadora: unaPerforadora

	self subclassResponsibility! !

!TipoDeMecha methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:06:50'!
darGolpeDeTaladroSobreTierraConPerforadora: unaPerforadora

	self subclassResponsibility! !


!classDefinition: #MechaDeDiamante category: #'ISW1-2023-1C-Parcial-1'!
TipoDeMecha subclass: #MechaDeDiamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaDeDiamante methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:05:12'!
darGolpeDeTaladroSobreArenaConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreArenaConMechaDiamante! !

!MechaDeDiamante methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:07:30'!
darGolpeDeTaladroSobreConcretoConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreConcretoConMechaDiamante! !

!MechaDeDiamante methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:07:49'!
darGolpeDeTaladroSobreTierraConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreTierraConMechaDiamante! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MechaDeDiamante class' category: #'ISW1-2023-1C-Parcial-1'!
MechaDeDiamante class
	instanceVariableNames: 'uniqueInstance'!

!MechaDeDiamante class methodsFor: 'instance creation' stamp: 'IB 4/26/2024 15:07:11'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^uniqueInstance! !


!classDefinition: #MechaDeSoft category: #'ISW1-2023-1C-Parcial-1'!
TipoDeMecha subclass: #MechaDeSoft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaDeSoft methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:04:56'!
darGolpeDeTaladroSobreArenaConPerforadora: unaPerforadora
	
	unaPerforadora darGolpeDeTaladroSobreArenaConMechaSoft! !

!MechaDeSoft methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:08:15'!
darGolpeDeTaladroSobreConcretoConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreConcretoConMechaSoft! !

!MechaDeSoft methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:09:48'!
darGolpeDeTaladroSobreTierraConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreTierraConMechaSoft! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MechaDeSoft class' category: #'ISW1-2023-1C-Parcial-1'!
MechaDeSoft class
	instanceVariableNames: 'uniqueInstance'!

!MechaDeSoft class methodsFor: 'instance creation' stamp: 'IB 4/26/2024 15:09:58'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^uniqueInstance! !


!classDefinition: #MechaDeWidia category: #'ISW1-2023-1C-Parcial-1'!
TipoDeMecha subclass: #MechaDeWidia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaDeWidia methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:05:35'!
darGolpeDeTaladroSobreArenaConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreArenaConMechaWidia! !

!MechaDeWidia methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:08:26'!
darGolpeDeTaladroSobreConcretoConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreConcretoConMechaWidia! !

!MechaDeWidia methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:08:42'!
darGolpeDeTaladroSobreTierraConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroSobreTierraConMechaWidia! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MechaDeWidia class' category: #'ISW1-2023-1C-Parcial-1'!
MechaDeWidia class
	instanceVariableNames: 'uniqueInstance'!

!MechaDeWidia class methodsFor: 'instance creation' stamp: 'IB 4/26/2024 15:10:05'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^uniqueInstance! !


!classDefinition: #MechaRota category: #'ISW1-2023-1C-Parcial-1'!
TipoDeMecha subclass: #MechaRota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaRota methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:34:37'!
darGolpeDeTaladroSobreArenaConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroCuandoMechaRota! !

!MechaRota methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:35:02'!
darGolpeDeTaladroSobreConcretoConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroCuandoMechaRota! !

!MechaRota methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:35:10'!
darGolpeDeTaladroSobreTierraConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroCuandoMechaRota! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MechaRota class' category: #'ISW1-2023-1C-Parcial-1'!
MechaRota class
	instanceVariableNames: 'uniqueInstance'!

!MechaRota class methodsFor: 'instance creation' stamp: 'IB 4/26/2024 15:10:11'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^uniqueInstance! !


!classDefinition: #SinMecha category: #'ISW1-2023-1C-Parcial-1'!
TipoDeMecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!SinMecha methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:25:03'!
darGolpeDeTaladroSobreArenaConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroCuandoSinMecha! !

!SinMecha methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:25:13'!
darGolpeDeTaladroSobreConcretoConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroCuandoSinMecha! !

!SinMecha methodsFor: 'conPerforadora' stamp: 'IB 4/26/2024 13:25:19'!
darGolpeDeTaladroSobreTierraConPerforadora: unaPerforadora
	unaPerforadora darGolpeDeTaladroCuandoSinMecha! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SinMecha class' category: #'ISW1-2023-1C-Parcial-1'!
SinMecha class
	instanceVariableNames: 'uniqueInstance'!

!SinMecha class methodsFor: 'instance creation' stamp: 'IB 4/26/2024 15:10:20'!
new
	uniqueInstance ifNil: [uniqueInstance := self basicNew initialize].
	^uniqueInstance! !
