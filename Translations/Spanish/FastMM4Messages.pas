{

Fast Memory Manager: Messages

Spanish translation by JRG (TheDelphiGuy@gmail.com).

Change Log:
  15 Feb 2006: Updated by Marcelo Montenegro.

}

unit FastMM4Messages;

interface

{$Include FastMM4Options.inc}

const
  {The name of the debug info support DLL}
  FullDebugModeLibraryName32Bit = 'FastMM_FullDebugMode.dll';
  FullDebugModeLibraryName64Bit = 'FastMM_FullDebugMode64.dll';
  {Event log strings}
  LogFileExtension = '_ManipuladorMemoria_Reporte.txt'#0;
  CRLF = #13#10;
  EventSeparator = '--------------------------------';
  {Class name messages}
  UnknownClassNameMsg = 'Desconocida';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'Vaciado de memoria actual de 256 bytes en la direcci�n ';
  {Block Error Messages}
  BlockScanLogHeader = 'El bloque reservado fue registrado por LogAllocatedBlocksToFile. El tama�o es: ';
  ErrorMsgHeader = 'FastMM ha detectado un error durante una operaci�n ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = 'de b�squeda de bloque libre';
  OperationMsg = '. ';
  BlockHeaderCorruptedMsg = 'El encabezamiento de bloque ha sido corrompido. ';
  BlockFooterCorruptedMsg = 'La terminaci�n de bloque ha sido corrompida. ';
  FreeModifiedErrorMsg = 'FastMM detect� que un bloque ha sido modificado luego de liberarse. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = 'Se realiz� un intento de liberar/reasignar un bloque no reservado.';
  WrongMMFreeErrorMsg = 'Se realiz� un intento de liberar/reasignar un bloque reservado a trav�s de una instancia distinta de FastMM. Chequee las opciones de uso compartido de su manipulador de memoria.';
  PreviousBlockSizeMsg = #13#10#13#10'El tama�o anterior del bloque era: ';
  CurrentBlockSizeMsg = #13#10#13#10'El tama�o del bloque es: ';
  PreviousObjectClassMsg = #13#10#13#10'El bloque estuvo anteriormente reservado para un objeto de clase: ';
  CurrentObjectClassMsg = #13#10#13#10'El bloque est� reservado para un objeto de clase: ';
  PreviousAllocationGroupMsg = #13#10#13#10'El grupo de la reservaci�n fue: ';
  PreviousAllocationNumberMsg = #13#10#13#10'El n�mero de la reservaci�n fue: ';
  CurrentAllocationGroupMsg = #13#10#13#10'El grupo de la reservaci�n es: ';
  CurrentAllocationNumberMsg = #13#10#13#10'El n�mero de la reservaci�n es: ';
  BlockErrorMsgTitle = 'Detectado error de memoria';
  VirtualMethodErrorHeader =
    'FastMM ha detectado un intento de ejecutar un m�todo virtual de un objeto liberado. Una violaci�n de acceso se generar� ahora para abortar la operaci�n.';
  InterfaceErrorHeader =
    'FastMM ha detectado un intento de utlizaci�n de una interfaz de un objeto liberado. Una violaci�n de acceso se generar� ahora para abortar la operaci�n.';
  BlockHeaderCorruptedNoHistoryMsg =
    ' Desafortunadamente el encabezamiento de bloque ha sido corrompido, as� que no hay historia disponible.';
  FreedObjectClassMsg = #13#10#13#10'Clase del objeto liberado: ';
  VirtualMethodName = #13#10#13#10'M�todo virtual: ';
  VirtualMethodOffset = 'Desplazamiento +';
  VirtualMethodAddress = #13#10#13#10'Direcci�n del m�todo virtual: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'El ID del hilo actual es 0x';
  CurrentStackTraceMsg = ', y el vaciado del stack (direcciones de retorno) que conduce a este error es:';
  ThreadIDPrevAllocMsg = #13#10#13#10'Este bloque fue previamente reservado por el hilo 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'Este bloque fue reservado por el hilo 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'Este bloque fue previamente liberado por el hilo 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'El objeto fue reservado por el hilo 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'El objeto fue posteriormente liberado por el hilo 0x';
  StackTraceMsg = ', y el vaciado del stack (direcciones de retorno) en ese momento es:';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 ya ha sido instalado.';
  AlreadyInstalledTitle = 'Ya instalado.';
  OtherMMInstalledMsg =
    'FastMM4 no puede instalarse ya que otro manipulador de memoria alternativo se ha instalado anteriormente.'#13#10 +
    'Si desea utilizar FastMM4, por favor aseg�rese de que FastMM4.pas es la primera unit en la secci�n "uses"'#13#10 +
    'del .DPR de su proyecto.';
  OtherMMInstalledTitle = 'FastMM4 no se puede instalar - Otro manipulador de memoria instalado';
  MemoryAllocatedMsg =
    'FastMM4 no puede instalarse ya que se ha reservado memoria mediante el manipulador de memoria est�ndar.'#13#10 +
    'FastMM4.pas TIENE que ser la primera unit en el fichero .DPR de su proyecto, de otra manera podr�a reservarse memoria'#13#10 +
    'mediante el manipulador de memoria est�ndar antes de que FastMM4 pueda ganar el control. '#13#10#13#10 +
    'Si est� utilizando un interceptor de excepciones como MadExcept (o cualquier otra herramienta que modifique el orden de inicializaci�n de las units),'#13#10 + //Fixed by MFM
    'vaya a su p�gina de configuraci�n y aseg�rese de que FastMM4.pas es inicializada antes que cualquier otra unit.';
  MemoryAllocatedTitle = 'FastMM4 no se puede instalar - Ya se ha reservado memoria';
  {Leak checking messages}
  LeakLogHeader = 'Ha habido una fuga de memoria. El tama�o del bloque es: ';
  LeakMessageHeader = 'Esta aplicaci�n ha tenido fugas de memoria. ';
  SmallLeakDetail = 'Las fugas de memoria en los bloques peque�os son'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluyendo las fugas esperadas registradas por apuntador)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = 'Las fugas de memoria de bloques medianos y grandes son'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluyendo las fugas esperadas registrados por apuntador)'
{$endif}
    + ': ';
  BytesMessage = ' bytes: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Nota: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'Este chequeo de escape de memoria s�lo se realiza si Delphi est� ejecut�ndose en el mismo ordenador. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + 'Los detalles del escape de memoria se salvan a un fichero texto en la misma carpeta donde reside esta aplicaci�n. '
    {$else}
    + 'Habilite "LogMemoryLeakDetailToFile" para obtener un *log* con los detalles de los escapes de memoria. '
    {$endif}
  {$else}
    + 'Para obtener un *log* con los detalles de los escapes de memoria, abilite las definiciones condicionales "FullDebugMode" y "LogMemoryLeakDetailToFile". '
  {$endif}
    + 'Para deshabilitar este chequeo de fugas de memoria, indefina "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = 'Detectada fuga de memoria';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM ha sido instalado.';
  FastMMInstallSharedMsg = 'Compartiendo una instancia existente de FastMM.';
  FastMMUninstallMsg = 'FastMM ha sido desinstalado.';
  FastMMUninstallSharedMsg = 'Cesando de compartir una instancia existente de FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'Operaci�n en el MM luego de desinstalarlo.';
  InvalidGetMemMsg = 'FastMM ha detectado una llamada a GetMem luego de desinstalar FastMM.';
  InvalidFreeMemMsg = 'FastMM ha detectado una llamada a FreeMem luego de desinstalar FastMM.';
  InvalidReallocMemMsg = 'FastMM ha detectado una llamada a ReallocMem luego de desinstalar FastMM.';
  InvalidAllocMemMsg = 'FastMM ha detectado una llamada a ReallocMem luego de desinstalar FastMM.';
{$endif}

{$ifdef LogLockContention}
  LockingReportTitle = 'Locking Report';
{$endif}
{$ifdef LogLockContention}
  LockingReportHeader = 'Top locking contention sites';
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageHeader = 'Release stack usage statistics';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageSmallBlocksMsg1 = 'Small blocks [';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageSmallBlocksMsg2 = ']: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageTotalSmallBlocksMsg = 'Total small blocks: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageMediumBlocksMsg = 'Medium blocks: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageLargeBlocksMsg = 'Large blocks: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageTotalMemoryMsg = 'Total memory: ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageBuffers1Msg = ' in ';
{$endif}
{$endif}
{$ifdef UseReleaseStack}
{$ifdef DebugReleaseStack}
  ReleaseStackUsageBuffers2Msg = ' buffers [';
{$endif}
{$endif}

implementation

end.

