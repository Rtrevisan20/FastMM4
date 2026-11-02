{

Fast Memory Manager: Messages

Italian translation by Luigi D. Sandon.

}

unit FastMM4Messages;

interface

{$Include FastMM4Options.inc}

const
  {The name of the debug info support DLL}
  FullDebugModeLibraryName32Bit = 'FastMM_FullDebugMode.dll';
  FullDebugModeLibraryName64Bit = 'FastMM_FullDebugMode64.dll';
  {Event log strings}
  LogFileExtension = '_MemoryManager_EventLog.txt'#0;
  CRLF = #13#10;
  EventSeparator = '--------------------------------';
  {Class name messages}
  UnknownClassNameMsg = 'Sconosciuta';
  {Memory dump message}
  MemoryDumpMsg = #13#10#13#10'Dump della memoria di 256 byte partendo dall''indirizzo del puntatore ';
  {Block Error Messages}
  BlockScanLogHeader = 'Blocco allocato registrato da LogAllocatedBlocksToFile. La dimensione �: ';
  ErrorMsgHeader = 'FastMM ha rilevato un errore durante ';
  GetMemMsg = 'GetMem';
  FreeMemMsg = 'FreeMem';
  ReallocMemMsg = 'ReallocMem';
  BlockCheckMsg = 'scansione blocco libero';
  OperationMsg = ' operazione. ';
  BlockHeaderCorruptedMsg = 'L''intestazione del blocco � stata corrotta. ';
  BlockFooterCorruptedMsg = 'Il terminatore del blocco � stato corrotto. ';
  FreeModifiedErrorMsg = 'FastMM ha rilevato che un blocco � stato modificato dopo essere stato disallocato. ';
  FreeModifiedDetailMsg = #13#10#13#10'Modified byte offsets (and lengths): ';
  DoubleFreeErrorMsg = 'Tentativo di disallocare/reallocare un blocco non allocato.';
  WrongMMFreeErrorMsg = 'An attempt has been made to free/reallocate a block that was allocated through a different FastMM instance. Check your memory manager sharing settings.';
  PreviousBlockSizeMsg = #13#10#13#10'La dimensione precedente del blocco era: ';
  CurrentBlockSizeMsg = #13#10#13#10'La dimensione del blocco �: ';
  PreviousObjectClassMsg = #13#10#13#10'Il blocco � stato usato in precedenza per una istanza della classe: ';
  CurrentObjectClassMsg = #13#10#13#10'Il blocco � attualmente usato da una istanza della classe: ';
  PreviousAllocationGroupMsg = #13#10#13#10'Il gruppo di allocazione era: ';
  PreviousAllocationNumberMsg = #13#10#13#10'Il numero di allocazione era: ';
  CurrentAllocationGroupMsg = #13#10#13#10'Il gruppo di allocazione �: ';
  CurrentAllocationNumberMsg = #13#10#13#10'Il numero di allocazione �: ';
  BlockErrorMsgTitle = 'Rilevato Errore di Memoria';
  VirtualMethodErrorHeader = 'FastMM ha rilevato un tentativo di chiamare un metodo virtuale di una istanza deallocata. Sar� generata una eccezione di Violazione di Accesso per abortire l''operazione corrente.';
  InterfaceErrorHeader = 'FastMM ha rilevato un tentativo di usare una interfaccia di una istanza deallocata. Sar� generata una eccezione di Violazione di Accesso per abortire l''operazione corrente.';
  BlockHeaderCorruptedNoHistoryMsg = ' Sfortunametamente l''intestazione del blocco � stata corrotta, quindi non � disponibile alcuna storia.';
  FreedObjectClassMsg = #13#10#13#10'Deallocata istanza della classe: ';
  VirtualMethodName = #13#10#13#10'Metodo virtuale: ';
  VirtualMethodOffset = 'Offset +';
  VirtualMethodAddress = #13#10#13#10'Indirizzo metodo virtuale: ';
  {Stack trace messages}
  CurrentThreadIDMsg = #13#10#13#10'The current thread ID is 0x';
  CurrentStackTraceMsg = ', and the stack trace (return addresses) leading to this error is:';
  ThreadIDPrevAllocMsg = #13#10#13#10'This block was previously allocated by thread 0x';
  ThreadIDAtAllocMsg = #13#10#13#10'This block was allocated by thread 0x';
  ThreadIDAtFreeMsg = #13#10#13#10'The block was previously freed by thread 0x';
  ThreadIDAtObjectAllocMsg = #13#10#13#10'The object was allocated by thread 0x';
  ThreadIDAtObjectFreeMsg = #13#10#13#10'The object was subsequently freed by thread 0x';
  StackTraceMsg = ', and the stack trace (return addresses) at the time was:';
  {Installation Messages}
  AlreadyInstalledMsg = 'FastMM4 � gi� installato.';
  AlreadyInstalledTitle = 'Gi� installato.';
  OtherMMInstalledMsg = 'FastMM4 non pu� essere installato perch� un altro gestore della memoria '
    + 'ha gi� installato s� stesso.'#13#10'Se volete usare FastMM4, '
    + 'assicuratevi che FastMM4.pas sia la prima unit nella sezione "uses"'
    + #13#10'del file .dpr del vostro progetto.';
  OtherMMInstalledTitle = 'Impossibile installare FastMM4 - un altro gestore della memoria � gi� installato';
  MemoryAllocatedMsg =
    'FastMM4 non pu� essere installato perch� della memoria � gi� ' +
    'stata allocata dal gestore della memoria di default.'#13#10 +
    'FastMM4.pas DEVE essere la prima unit nel file .dpr del progetto, ' +
    'altrimenti la memoria pu� essere allocata dal gestore di default ' +
    'prima che FastMM4 ottenga il controllo.'#13#10#13#10 +
    'Se state usando un gestore delle eccezioni come MadExcept (o qualsiasi ' +
    'altro tool che modifichi l''ordine di inizializzazione delle unit), ' +
    'configurarlo in modo che la unit FastMM4.pas sia inizializzata prima di qualsiasi altra.';
  MemoryAllocatedTitle = 'Impossibile installare FastMM4 - La memoria � gi� stata allocata';
  {Leak checking messages}
  LeakLogHeader = 'Leak di un blocco. La dimensione �: ';
  LeakMessageHeader = 'L''applicazione ha dei leak di memoria. ';
  SmallLeakDetail = 'I leak di piccoli blocchi sono'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (sono esclusi i leak attesi registrati da puntatori)'
{$endif}
    + ':'#13#10;
  LargeLeakDetail = 'Le dimensioni dei leak di blocchi medi e grandi sono'
{$ifdef HideExpectedLeaksRegisteredByPointer}
    + ' (sono esclusi i leak attesi registrati da puntatori)'
{$endif}
    + ': ';
  BytesMessage = ' byte: ';
  AnsiStringBlockMessage = 'AnsiString';
  UnicodeStringBlockMessage = 'UnicodeString';
  LeakMessageFooter = #13#10
{$ifndef HideMemoryLeakHintMessage}
    + #13#10'Nota: '
  {$ifdef RequireIDEPresenceForLeakReporting}
    + 'Questi controlli di leak della memoria sono effettuati solo se Delphi � in funzione sullo stesso computer. '
  {$endif}
  {$ifdef FullDebugMode}
    {$ifdef LogMemoryLeakDetailToFile}
    + 'I dettagli sui leak della memoria sono registrati in un file di testo nella stessa cartella di questa applicazione. '
    {$else}
    + 'Abilitare "LogMemoryLeakDetailToFile" per ottenere un file di log contenente i dettagli sui leak della memoria. '
    {$endif}
  {$else}
    + 'Per ottenere un file di log contenente i dettagli sui leak della memoria, abilitate le direttive condizionali "FullDebugMode" e "LogMemoryLeakDetailToFile". '
  {$endif}
    + 'Per disabilitare i controlli dei leak della memoria, non definire la direttiva "EnableMemoryLeakReporting".'#13#10
{$endif}
    + #0;
  LeakMessageTitle = 'Rilevato leak della memoria';
{$ifdef UseOutputDebugString}
  FastMMInstallMsg = 'FastMM � stato installato.';
  FastMMInstallSharedMsg = 'Inizio condivisione di una istanza esistente di FastMM.';
  FastMMUninstallMsg = 'FastMM � stato disinstallato.';
  FastMMUninstallSharedMsg = 'Termine della condivisione di una istanza esistente di FastMM.';
{$endif}
{$ifdef DetectMMOperationsAfterUninstall}
  InvalidOperationTitle = 'MM operazione dopo la disinstallazione.';
  InvalidGetMemMsg = 'FastMM ha rilevato una chiamata a GetMem dopo che FastMM � stato disinstallato.';
  InvalidFreeMemMsg = 'FastMM ha rilevato una chiamata a FreeMem dopo che FastMM � stato disinstallato.';
  InvalidReallocMemMsg = 'FastMM ha rilevato una chiamata a ReallocMem dopo che FastMM � stato disinstallato.';
  InvalidAllocMemMsg = 'FastMM ha rilevato una chiamata ad AllocMem dopo che FastMM � stato disinstallato.';
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

