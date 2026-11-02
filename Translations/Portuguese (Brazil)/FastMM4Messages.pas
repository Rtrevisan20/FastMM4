{

Fast Memory Manager: Messages

Portuguese (Brazil) translation by Johni Jeferson Capeletto (capeletto@gmail.com) - Love you Julia.

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
  MemoryDumpMsg = #13#10#13#10'Dump de mem�ria atual de 256 bytes iniciando no endere�o ';
  {Block Error Messages}
  BlockScanLogHeader = 'Bloco alocado logado por LogAllocatedBlocksToFile. O tamanho �: ';
  ErrorMsgHeader = 'FastMM detectou um erro durante ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = 'busca de bloco livre';
  OperationMsg = ' opera��o. ';
  BlockHeaderCorruptedMsg = 'O cabe�alho do bloco foi corrompido. ';
  BlockFooterCorruptedMsg = 'O rodap� do bloco foi corrompido. ';
  FreeModifiedErrorMsg = 'FastMM detectou que um bloco foi modificado ap�s ter sido liberado. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = 'Uma tentativa foi feita para liberar/realocar um bloco n�o alocado.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'O tamanho anterior do bloco era: ';
  CurrentBlockSizeMsg = #13#10#13#10'O tamanho do bloco �: ';
  PreviousObjectClassMsg = #13#10#13#10'O bloco foi usado anteriormente por um objeto da classe: ';
  CurrentObjectClassMsg = #13#10#13#10'O bloco est� sendo usado por um objeto da classe: ';
  PreviousAllocationGroupMsg = #13#10#13#10'O grupo de aloca��o era: ';
  PreviousAllocationNumberMsg = #13#10#13#10'O n�mero da aloca��o era: ';
  CurrentAllocationGroupMsg = #13#10#13#10'O grupo de aloca��o �: ';
  CurrentAllocationNumberMsg = #13#10#13#10'O n�mero da aloca��o �: ';
  BlockErrorMsgTitle = 'Erro de mem�ria detectado';
  VirtualMethodErrorHeader = 'FastMM detectou uma tentativa de chamada a um m�todo virtual de um objeto liberado. Uma viola��o de acesso ser� disparada para abortar a opera��o corrente.';
  InterfaceErrorHeader = 'FastMM detectou uma tentativa de uso de uma interface de um objeto liberado. Uma viola��o de acesso ser� disparada para abortar a opera��o corrente.';
  BlockHeaderCorruptedNoHistoryMsg = ' Infelizmente o cabe�alho do bloco foi corrompido e a hist�ria n�o est� dispon�vel.';
  FreedObjectClassMsg = #13#10#13#10'Classe do objeto liberado: ';
  VirtualMethodName = #13#10#13#10'M�todo virtual: ';
  VirtualMethodOffset = 'Offset +';
  VirtualMethodAddress = #13#10#13#10'Endere�o do m�todo virtual: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'O ID da thread atual � 0x';
  CurrentStackTraceMsg = ', e a an�lise da pilha interna (endere�os de retorno) que levaram a este erro �:';
  ThreadIDPrevAllocMsg = #13#10#13#10'Este bloco foi criado anteriormente pela thread 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'Este bloco foi alocado pela thread 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'Este bloco foi liberado anteriormente pela thread 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'O objeto foi alocado pela thread 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'O objeto foi liberado posteriormente pela thread 0x';
  StackTraceMsg = ', e a an�lise da pilha interna (endere�os de retorno) no momento era:';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 j� foi instalado.';
  AlreadyInstalledTitle = 'J� foi instalado.';
  OtherMMInstalledMsg = 'FastMM4 n�o pode ser instalado j� que outro gerenciador externo '
    + 'de mem�ria j� foi instalado.'#13#10'Se voc� quer usar o FastMM4, '
    + 'tenha certeza que a unit FastMM4.pas seja a primeira na se��o "uses"'
    + #13#10'do arquivo .dpr do seu projeto.';
  OtherMMInstalledTitle = 'Imposs�vel instalar FastMM4 - Outro gerenciador de mem�ria j� est� instalado';
  MemoryAllocatedMsg = 'O FastMM4 n�o pode ser instalado j� que a mem�ria j� foi '
    + 'alocada atrav�s do gerenciador de mem�ria padr�o.'#13#10'FastMM4.pas DEVE '
    + 'ser a primeira unit no arquivo .dpr do seu projeto, caso contr�rio a mem�ria pode '
    + 'ser alocada'#13#10'atrav�s do gerenciador de mem�ria padr�o antes que o FastMM '
    + 'ganhe o controle. '#13#10#13#10'Se voc� estiver usando um interceptador de exce��es '
    + 'como MadExcept (ou qualquer outra ferramenta que modifica a ordem de inicializa��o da '
    + 'unit),'#13#10'v� para sua p�gina de configura��o e tenha certeza que a unit '
    + 'FastMM4.pas seja inicializada antes de qualquer outra unit.';
  MemoryAllocatedTitle = 'Imposs�vel instalar FastMM4 - A mem�ria j� foi alocada';
  {Leak checking messages}
  LeakLogHeader = 'Um bloco de mem�ria vazou. O tamanho �: ';
  LeakMessageHeader = 'Essa aplica��o teve vazamentos de mem�ria. ';
  SmallLeakDetail = 'Os vazamentos dos blocos pequenos s�o'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluindo os vazamentos esperados registrados por ponteiro)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = 'O tamanho dos vazamentos dos blocos m�dios e grandes s�o'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (excluindo os vazamentos esperados registrados por ponteiro)'
{$endif}
    + ': ';
  BytesMessage = ' bytes: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Nota: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'Essa checagem de vazamento de mem�ria somente � feita se o Delphi est� rodando atualmente no mesmo computador. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + 'O detalhe do vazamento de mem�ria est� logado em um arquivo texto na mesma pasta que essa aplica��o. '
    {$else}
    + 'Habilite o DEFINE "LogMemoryLeakDetailToFile" para obter um arquivo de log contendo detalhes dos vazamentos de mem�ria. '
    {$endif}
  {$else}
    + 'Para obter um arquivo de log contendo detalhes dos vazamentos de mem�ria, habilite os DEFINES "FullDebugMode" e "LogMemoryLeakDetailToFile". '
  {$endif}
    + 'Para desabilitar essa checagem de vazamento de mem�ria, desabilite o DEFINE "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = 'Vazamento de mem�ria detectado';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM foi instalado.';
  FastMMInstallSharedMsg = 'Compartilhando uma instancia existente do FastMM.';
  FastMMUninstallMsg = 'FastMM foi desinstalado.';
  FastMMUninstallSharedMsg = 'Parando de compartilhar uma instancia existente do FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'Opera��o no Gerenciador de Mem�ria ap�s desinstala��o.';
  InvalidGetMemMsg = 'FastMM detectou uma chamada GetMem depois que o FastMM foi desinstalado.';
  InvalidFreeMemMsg = 'FastMM detectou uma chamada FreeMem depois que o FastMM foi desinstalado.';
  InvalidReallocMemMsg = 'FastMM detectou uma chamada ReallocMem depois que o FastMM foi desinstalado.';
  InvalidAllocMemMsg = 'FastMM detectou uma chamada ReallocMem depois que o FastMM foi desinstalado.';
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

