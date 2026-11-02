{

Fast Memory Manager: Messages

Portuguese translation by Carlos Ma��o (Carlos.Macao@gmail.com).

}

unit FastMM4Messages;

interface

{$Include FastMM4Options.inc}

const
  {The name of the debug info support DLL}
  FullDebugModeLibraryName32Bit = 'FastMM_FullDebugMode.dll';
  FullDebugModeLibraryName64Bit = 'FastMM_FullDebugMode64.dll';
  {Event log strings}
  LogFileExtension = '_MemoryManager_EventosLog.txt'#0;
  CRLF = #13#10;
  EventSeparator = '--------------------------------';
  {Class name messages}
  UnknownClassNameMsg = 'Desconhecida';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'O Dump de mem�ria actual de 256 bytes tem inicio no endere�o ';
  {Block Error Messages}
  BlockScanLogHeader = 'Bloco atribu�do registado por LogAllocatedBlocksToFile. O Tamanho �: ';
  ErrorMsgHeader = 'FastMM detectou um erro durante ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = 'procura de bloco livre';
  OperationMsg = ' opera��o. ';
  BlockHeaderCorruptedMsg = 'O cabe�alho do bloco foi corrompido. ';
  BlockFooterCorruptedMsg = 'O rodap� do bloco foi corrompido. ';
  FreeModifiedErrorMsg = 'FastMM detectou que um bloco de mem�ria foi modificado ap�s ter sido libertado. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = 'Foi feita uma tentativa para libertar/atribuir um bloco n�o atribuido.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'O tamanho anterior do bloco era: ';
  CurrentBlockSizeMsg = #13#10#13#10'O tamanho do bloco �: ';
  PreviousObjectClassMsg = #13#10#13#10'O bloco foi usado anteriormente por um objecto da classe: ';
  CurrentObjectClassMsg = #13#10#13#10'O bloco est� sendo usado por um objecto da classe: ';
  PreviousAllocationGroupMsg = #13#10#13#10'O grupo de atribui��o era: ';
  PreviousAllocationNumberMsg = #13#10#13#10'O n�mero de atribui��o era: ';
  CurrentAllocationGroupMsg = #13#10#13#10'O grupo de atribui��o �: ';
  CurrentAllocationNumberMsg = #13#10#13#10'O n�mero de atribui��o era: ';
  BlockErrorMsgTitle = 'Erro de mem�ria detectado';
  VirtualMethodErrorHeader = 'FastMM detectou uma tentativa de chamada a um m�todo virtual de um objecto libertado. Uma viola��o de acesso ser� iniciada para abortar a opera��o corrente.';
  InterfaceErrorHeader = 'FastMM detectou uma tentativa de uso de uma interface de um objecto libertado. Uma viola��o de acesso ser� iniciada para abortar a opera��o corrente.';
  BlockHeaderCorruptedNoHistoryMsg = ' Infelizmente o cabe�alho do bloco foi corrompido e o hist�rico n�o est� dispon�vel.';
  FreedObjectClassMsg = #13#10#13#10'Classe do objecto libertado: ';
  VirtualMethodName = #13#10#13#10'M�todo virtual: ';
  VirtualMethodOffset = 'Deslocamento +';
  VirtualMethodAddress = #13#10#13#10'Endere�o do m�todo virtual: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'O ID da thread actual � 0x';
  CurrentStackTraceMsg = ', e a an�lise da pilha interna (endere�os de retorno) que conduziram a este erro �:';
  ThreadIDPrevAllocMsg = #13#10#13#10'Este bloco foi pr�viamente criado pela thread 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'Este bloco foi criado pela thread 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'Este bloco foi pr�viamente libertado pela thread 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'O objecto foi criado pela thread 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'O objecto foi posteriormente libertado pela thread 0x';
  StackTraceMsg = ', e a an�lise da pilha interna (endere�os de retorno) nesse momento era:';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 j� se encontra instalado.';
  AlreadyInstalledTitle = 'J� se encontra instalado.';
  OtherMMInstalledMsg = 'FastMM4 n�o p�de ser instalado j� que outro gestor '
    + 'de mem�ria externo j� foi instalado.'#13#10'Se voc� quer usar o FastMM4, '
    + 'garanta que a unit FastMM4.pas � a primeira na sec��o "uses"'
    + #13#10'do ficheiro .dpr do seu projecto.';
  OtherMMInstalledTitle = 'Imposs�vel instalar FastMM4 - Outro gestor de mem�ria j� se encontra instalado';
  MemoryAllocatedMsg = 'O FastMM4 n�o pode ser instalado j� que a mem�ria j� foi '
    + 'atribuida atrav�s do gestor de mem�ria padr�o.'#13#10'FastMM4.pas DEVE '
    + 'ser a primeira unit no arquivo .dpr do seu projecto, caso contr�rio a mem�ria pode '
    + 'ser atribuida'#13#10'atrav�s do gestor de mem�ria padr�o antes que o FastMM '
    + 'obtenha o controle. '#13#10#13#10'Se voc� estiver usando um interceptador de excep��es '
    + 'como MadExcept (ou qualquer outra ferramenta que modifica a ordem de inicializa��o da '
    + 'unit),'#13#10'v� para sua p�gina de configura��o e assegure-se que a unit '
    + 'FastMM4.pas ''� inicializada antes de qualquer outra unit.';
  MemoryAllocatedTitle = 'Imposs�vel instalar FastMM4 - A mem�ria j� foi atribuida';
  {Leak checking messages}
  LeakLogHeader = 'Um bloco de mem�ria n�o foi libertado. O tamanho �: ';
  LeakMessageHeader = 'Esta aplica��o teve fugas de mem�ria. ';
  SmallLeakDetail = 'As fugas dos blocos pequenos s�o'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluindo as fugas esperadas, registadas por ponteiro)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = 'O tamanho das fugas dos blocos m�dios e grandes �'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluindo as fugas esperadas registadas por ponteiro)'
{$endif}
    + ': ';
  BytesMessage = ' bytes: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Nota: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'Os testes de fugas de mem�ria s� ser�o efectuados se o Delphi estiver activo no mesmo computador. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + 'O detalhe da fuga de mem�ria foi registado num ficheiro de texto na mesma pasta desta aplica��o. '
    {$else}
    + 'Active o DEFINE "LogMemoryLeakDetailToFile" para obter um ficheiro de registos contendo detalhes das fugas de mem�ria. '
    {$endif}
  {$else}
    + 'Para obter um ficheiro de registo contendo detalhes das fugas de mem�ria, active os DEFINES "FullDebugMode" e "LogMemoryLeakDetailToFile". '
  {$endif}
    + 'Para activar a detec��o de fugas de mem�ria, active o DEFINE "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = 'Fuga de mem�ria detectada';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM foi instalado.';
  FastMMInstallSharedMsg = 'Partilhando uma inst�ncia j� existente do FastMM.';
  FastMMUninstallMsg = 'FastMM foi removido.';
  FastMMUninstallSharedMsg = 'Parando a partilha duma inst�ncia existente do FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'Opera��o com o gestor de Mem�ria ap�s a sua remo��o.';
  InvalidGetMemMsg = 'FastMM detectou uma chamada a GetMem ap�s a remo��o do FastMM.';
  InvalidFreeMemMsg = 'FastMM detectou uma chamada a FreeMem ap�s a remo��o do FastMM.';
  InvalidReallocMemMsg = 'FastMM detectou uma chamada a ReallocMem ap�s a remo��o do FastMM.';
  InvalidAllocMemMsg = 'FastMM detectou uma chamada a ReallocMem ap�s a remo��o do FastMM.';
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

