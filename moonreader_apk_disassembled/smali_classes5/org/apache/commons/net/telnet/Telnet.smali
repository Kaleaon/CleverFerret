.class Lorg/apache/commons/net/telnet/Telnet;
.super Lorg/apache/commons/net/SocketClient;
.source "Telnet.java"


# static fields
.field static final COMMAND_AYT:[B

.field static final COMMAND_DO:[B

.field static final COMMAND_DONT:[B

.field static final COMMAND_IS:[B

.field static final COMMAND_SB:[B

.field static final COMMAND_SE:[B

.field static final COMMAND_WILL:[B

.field static final COMMAND_WONT:[B

.field static final DEFAULT_PORT:I = 0x17

.field static final DO_MASK:I = 0x2

.field static final REQUESTED_DO_MASK:I = 0x8

.field static final REQUESTED_WILL_MASK:I = 0x4

.field protected static final TERMINAL_TYPE:I = 0x18

.field protected static final TERMINAL_TYPE_IS:I = 0x0

.field protected static final TERMINAL_TYPE_SEND:I = 0x1

.field static final WILL_MASK:I = 0x1

.field static final debug:Z = false

.field static final debugoptions:Z = false


# instance fields
.field private volatile aytFlag:Z

.field private final aytMonitor:Ljava/lang/Object;

.field private final doResponse:[I

.field private notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

.field private final optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

.field private final options:[I

.field private volatile spyStream:Ljava/io/OutputStream;

.field private terminalType:Ljava/lang/String;

.field private final willResponse:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x2

    .line 34
    new-array v1, v0, [B

    fill-array-data v1, :array_0

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_DO:[B

    .line 38
    new-array v1, v0, [B

    fill-array-data v1, :array_1

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_DONT:[B

    .line 42
    new-array v1, v0, [B

    fill-array-data v1, :array_2

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_WILL:[B

    .line 46
    new-array v1, v0, [B

    fill-array-data v1, :array_3

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_WONT:[B

    .line 50
    new-array v1, v0, [B

    fill-array-data v1, :array_4

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_SB:[B

    .line 54
    new-array v1, v0, [B

    fill-array-data v1, :array_5

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_SE:[B

    .line 89
    new-array v1, v0, [B

    fill-array-data v1, :array_6

    sput-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_IS:[B

    .line 111
    new-array v0, v0, [B

    fill-array-data v0, :array_7

    sput-object v0, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_AYT:[B

    return-void

    :array_0
    .array-data 1
        -0x1t
        -0x3t
    .end array-data

    nop

    :array_1
    .array-data 1
        -0x1t
        -0x2t
    .end array-data

    nop

    :array_2
    .array-data 1
        -0x1t
        -0x5t
    .end array-data

    nop

    :array_3
    .array-data 1
        -0x1t
        -0x4t
    .end array-data

    nop

    :array_4
    .array-data 1
        -0x1t
        -0x6t
    .end array-data

    nop

    :array_5
    .array-data 1
        -0x1t
        -0x10t
    .end array-data

    nop

    :array_6
    .array-data 1
        0x18t
        0x0t
    .end array-data

    nop

    :array_7
    .array-data 1
        -0x1t
        -0xat
    .end array-data
.end method

.method constructor <init>()V
    .locals 2

    .line 139
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    .line 118
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 123
    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    const/16 v0, 0x17

    .line 140
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->setDefaultPort(I)V

    const/16 v0, 0x100

    .line 141
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    .line 142
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    .line 143
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    .line 144
    new-array v0, v0, [Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 155
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    .line 118
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 123
    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    const/16 v0, 0x17

    .line 156
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->setDefaultPort(I)V

    const/16 v0, 0x100

    .line 157
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    .line 158
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    .line 159
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    .line 160
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    .line 161
    new-array p1, v0, [Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    return-void
.end method


# virtual methods
.method protected _connectAction_()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x100

    if-ge v1, v2, :cond_1

    .line 837
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aput v0, v2, v1

    .line 838
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aput v0, v2, v1

    .line 839
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aput v0, v2, v1

    .line 840
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v2, v2, v1

    if-eqz v2, :cond_0

    .line 842
    invoke-virtual {v2, v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setDo(Z)V

    .line 843
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setWill(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 848
    :cond_1
    invoke-super {p0}, Lorg/apache/commons/net/SocketClient;->_connectAction_()V

    .line 849
    new-instance v1, Ljava/io/BufferedInputStream;

    iget-object v3, p0, Lorg/apache/commons/net/telnet/Telnet;->_input_:Ljava/io/InputStream;

    invoke-direct {v1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_input_:Ljava/io/InputStream;

    .line 850
    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v3, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-direct {v1, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    :goto_1
    if-ge v0, v2, :cond_4

    .line 855
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    if-eqz v1, :cond_3

    .line 857
    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitLocal()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 859
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getOptionCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/telnet/Telnet;->requestWill(I)V

    .line 862
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitRemote()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 864
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getOptionCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/telnet/Telnet;->requestDo(I)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return-void
.end method

.method _registerSpyStream(Ljava/io/OutputStream;)V
    .locals 0

    .line 1179
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    return-void
.end method

.method final _sendAYT(J)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1063
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    monitor-enter v0

    .line 1065
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    .line 1067
    :try_start_1
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 1068
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v3, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_AYT:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 1069
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 1070
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1071
    :try_start_2
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    invoke-virtual {v2, p1, p2}, Ljava/lang/Object;->wait(J)V

    .line 1072
    iget-boolean p1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    const/4 p2, 0x1

    if-nez p1, :cond_0

    .line 1075
    iput-boolean p2, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 1081
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return v1

    :catchall_0
    move-exception p1

    .line 1070
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1

    :catchall_1
    move-exception p1

    .line 1081
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p1
.end method

.method final declared-synchronized _sendCommand(B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 804
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 805
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 806
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 807
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method final declared-synchronized _sendSubnegotiation([I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    if-eqz p1, :cond_2

    .line 776
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_SB:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 778
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget v2, p1, v1

    int-to-byte v2, v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 782
    iget-object v3, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v3, v2}, Ljava/io/OutputStream;->write(I)V

    .line 784
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v3, v2}, Ljava/io/OutputStream;->write(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 786
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v0, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_SE:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 789
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 792
    :cond_2
    :goto_1
    monitor-exit p0

    return-void
.end method

.method _stopSpyStream()V
    .locals 1

    const/4 v0, 0x0

    .line 1188
    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    return-void
.end method

.method addOptionHandler(Lorg/apache/commons/net/telnet/TelnetOptionHandler;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1099
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getOptionCode()I

    move-result v0

    .line 1100
    invoke-static {v0}, Lorg/apache/commons/net/telnet/TelnetOption;->isValidOption(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1102
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v2, v1, v0

    if-nez v2, :cond_2

    .line 1104
    aput-object p1, v1, v0

    .line 1105
    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/Telnet;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1107
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitLocal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1109
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->requestWill(I)V

    .line 1112
    :cond_0
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getInitRemote()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1114
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->requestDo(I)V

    :cond_1
    return-void

    .line 1120
    :cond_2
    new-instance p1, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v1, "Already registered option"

    invoke-direct {p1, v1, v0}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw p1

    .line 1126
    :cond_3
    new-instance p1, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v1, "Invalid Option Code"

    invoke-direct {p1, v1, v0}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method deleteOptionHandler(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1141
    invoke-static {p1}, Lorg/apache/commons/net/telnet/TelnetOption;->isValidOption(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1143
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v1, v0, p1

    if-eqz v1, :cond_2

    const/4 v2, 0x0

    .line 1149
    aput-object v2, v0, p1

    .line 1151
    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getWill()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1153
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestWont(I)V

    .line 1156
    :cond_0
    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getDo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1158
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestDont(I)V

    :cond_1
    return-void

    .line 1145
    :cond_2
    new-instance v0, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v1, "Unregistered option"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 1163
    :cond_3
    new-instance v0, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;

    const-string v1, "Invalid Option Code"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/net/telnet/InvalidTelnetOptionException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method final declared-synchronized processAYTResponse()V
    .locals 2

    monitor-enter p0

    .line 815
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    if-nez v0, :cond_0

    .line 817
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x1

    .line 819
    :try_start_1
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytFlag:Z

    .line 820
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->aytMonitor:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 821
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 823
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method processCommand(I)V
    .locals 2

    .line 406
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_0

    const/4 v1, 0x5

    .line 408
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    :cond_0
    return-void
.end method

.method processDo(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 427
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 429
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 438
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    if-eqz v0, :cond_1

    .line 440
    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getAcceptLocal()Z

    move-result v0

    goto :goto_0

    :cond_1
    const/16 v0, 0x18

    if-ne p1, v0, :cond_2

    .line 448
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 458
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v3, v2, p1

    if-lez v3, :cond_3

    sub-int/2addr v3, v1

    .line 460
    aput v3, v2, p1

    if-lez v3, :cond_3

    .line 461
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsWill(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 463
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v3, v2, p1

    sub-int/2addr v3, v1

    aput v3, v2, p1

    .line 467
    :cond_3
    iget-object v2, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v2, v2, p1

    if-nez v2, :cond_5

    .line 469
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWont(I)Z

    move-result v2

    if-eqz v2, :cond_5

    if-eqz v0, :cond_4

    .line 483
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantWill(I)V

    .line 484
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendWill(I)V

    goto :goto_1

    .line 488
    :cond_4
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v2, v0, p1

    add-int/2addr v2, v1

    aput v2, v0, p1

    .line 489
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendWont(I)V

    .line 507
    :cond_5
    :goto_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWill(I)V

    return-void
.end method

.method processDont(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 523
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    .line 525
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 529
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v1, v0, p1

    if-lez v1, :cond_1

    add-int/lit8 v1, v1, -0x1

    .line 531
    aput v1, v0, p1

    if-lez v1, :cond_1

    .line 532
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsWont(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 534
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 538
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_4

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWill(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 550
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsWill(I)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWill(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 552
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendWont(I)V

    .line 555
    :cond_3
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantWont(I)V

    .line 559
    :cond_4
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWont(I)V

    return-void
.end method

.method processSuboption([II)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-lez p2, :cond_1

    .line 702
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    const/4 v1, 0x0

    aget v1, p1, v1

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    .line 705
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->answerSubnegotiation([II)[I

    move-result-object p1

    .line 707
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendSubnegotiation([I)V

    return-void

    :cond_0
    const/4 v0, 0x1

    if-le p2, v0, :cond_1

    const/16 p2, 0x18

    if-ne v1, p2, :cond_1

    .line 721
    aget p1, p1, v0

    if-ne p1, v0, :cond_1

    .line 724
    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/Telnet;->sendTerminalType()V

    :cond_1
    return-void
.end method

.method processWill(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 577
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    .line 579
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 587
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    if-eqz v0, :cond_1

    .line 589
    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->getAcceptRemote()Z

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 593
    :goto_0
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v2, v1, p1

    if-lez v2, :cond_2

    add-int/lit8 v2, v2, -0x1

    .line 595
    aput v2, v1, p1

    if-lez v2, :cond_2

    .line 596
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDo(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 598
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v2, v1, p1

    add-int/lit8 v2, v2, -0x1

    aput v2, v1, p1

    .line 602
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v1, p1

    if-nez v1, :cond_4

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDont(I)Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz v0, :cond_3

    .line 616
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantDo(I)V

    .line 617
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendDo(I)V

    goto :goto_1

    .line 621
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 622
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendDont(I)V

    .line 626
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setDo(I)V

    return-void
.end method

.method processWont(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 643
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    if-eqz v0, :cond_0

    const/4 v1, 0x4

    .line 645
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/net/telnet/TelnetNotificationHandler;->receivedNegotiation(II)V

    .line 650
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    if-lez v1, :cond_1

    add-int/lit8 v1, v1, -0x1

    .line 652
    aput v1, v0, p1

    if-lez v1, :cond_1

    .line 653
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDont(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 655
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 659
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_4

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDo(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 671
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDo(I)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDo(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 673
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendDont(I)V

    .line 676
    :cond_3
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantDont(I)V

    .line 680
    :cond_4
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setDont(I)V

    return-void
.end method

.method public registerNotifHandler(Lorg/apache/commons/net/telnet/TelnetNotificationHandler;)V
    .locals 0

    .line 1255
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    return-void
.end method

.method final declared-synchronized requestDo(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 901
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDo(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 902
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDo(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 904
    :cond_1
    monitor-exit p0

    return-void

    .line 906
    :cond_2
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantDo(I)V

    .line 907
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 908
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendDo(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 909
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method final declared-synchronized requestDont(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 941
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDont(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 942
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDont(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 944
    :cond_1
    monitor-exit p0

    return-void

    .line 946
    :cond_2
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantDont(I)V

    .line 947
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 948
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendDont(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 949
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method final declared-synchronized requestWill(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 982
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsWill(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 983
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWill(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 985
    :cond_1
    monitor-exit p0

    return-void

    .line 987
    :cond_2
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantWill(I)V

    .line 988
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 989
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendWill(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 990
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method final declared-synchronized requestWont(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 1022
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->willResponse:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsWont(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1023
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWont(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 1025
    :cond_1
    monitor-exit p0

    return-void

    .line 1027
    :cond_2
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->setWantWont(I)V

    .line 1028
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->doResponse:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 1029
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->sendWont(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1030
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method requestedDo(I)Z
    .locals 1

    .line 247
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget p1, v0, p1

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method requestedDont(I)Z
    .locals 0

    .line 259
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDo(I)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method requestedWill(I)Z
    .locals 1

    .line 223
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget p1, v0, p1

    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method requestedWont(I)Z
    .locals 0

    .line 235
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWill(I)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method final declared-synchronized sendByte(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 1041
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1044
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->spyWrite(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1047
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method final declared-synchronized sendDo(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 884
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_DO:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 885
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 888
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 890
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method final declared-synchronized sendDont(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 924
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_DONT:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 925
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 928
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 930
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method final declared-synchronized sendTerminalType()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 744
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 746
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_SB:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 747
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_IS:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 748
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/apache/commons/net/telnet/Telnet;->terminalType:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/Telnet;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 749
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_SE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 750
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 752
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method final declared-synchronized sendWill(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 965
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_WILL:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 966
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 969
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 971
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method final declared-synchronized sendWont(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 1005
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/commons/net/telnet/Telnet;->COMMAND_WONT:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 1006
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1009
    iget-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->_output_:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1011
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method setDo(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    or-int/lit8 v1, v1, 0x2

    aput v1, v0, p1

    .line 302
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedDo(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 304
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 306
    invoke-virtual {v0, v1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setDo(Z)V

    .line 308
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object p1, v0, p1

    .line 309
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->startSubnegotiationRemote()[I

    move-result-object p1

    if-eqz p1, :cond_0

    .line 313
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendSubnegotiation([I)V

    :cond_0
    return-void
.end method

.method setDont(I)V
    .locals 2

    .line 364
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x3

    aput v1, v0, p1

    .line 367
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object p1, v0, p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 369
    invoke-virtual {p1, v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setDo(Z)V

    :cond_0
    return-void
.end method

.method setWantDo(I)V
    .locals 2

    .line 337
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    or-int/lit8 v1, v1, 0x8

    aput v1, v0, p1

    return-void
.end method

.method setWantDont(I)V
    .locals 2

    .line 391
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x9

    aput v1, v0, p1

    return-void
.end method

.method setWantWill(I)V
    .locals 2

    .line 327
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    or-int/lit8 v1, v1, 0x4

    aput v1, v0, p1

    return-void
.end method

.method setWantWont(I)V
    .locals 2

    .line 381
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x5

    aput v1, v0, p1

    return-void
.end method

.method setWill(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 270
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    const/4 v2, 0x1

    or-int/2addr v1, v2

    aput v1, v0, p1

    .line 273
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->requestedWill(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {v0, v2}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setWill(Z)V

    .line 279
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object p1, v0, p1

    .line 280
    invoke-virtual {p1}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->startSubnegotiationLocal()[I

    move-result-object p1

    if-eqz p1, :cond_0

    .line 284
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->_sendSubnegotiation([I)V

    :cond_0
    return-void
.end method

.method setWont(I)V
    .locals 2

    .line 347
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget v1, v0, p1

    and-int/lit8 v1, v1, -0x2

    aput v1, v0, p1

    .line 350
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->optionHandlers:[Lorg/apache/commons/net/telnet/TelnetOptionHandler;

    aget-object p1, v0, p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 352
    invoke-virtual {p1, v0}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;->setWill(Z)V

    :cond_0
    return-void
.end method

.method spyRead(I)V
    .locals 3

    .line 1198
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    const/16 v1, 0xd

    if-eq p1, v1, :cond_1

    const/16 v2, 0xa

    if-ne p1, v2, :cond_0

    .line 1207
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 1209
    :cond_0
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1210
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const/4 p1, 0x0

    .line 1215
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    :cond_1
    return-void
.end method

.method spyWrite(I)V
    .locals 2

    const/4 v0, 0x1

    .line 1227
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDo(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1228
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/telnet/Telnet;->requestedDo(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1230
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_1

    .line 1235
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1236
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const/4 p1, 0x0

    .line 1240
    iput-object p1, p0, Lorg/apache/commons/net/telnet/Telnet;->spyStream:Ljava/io/OutputStream;

    :cond_1
    return-void
.end method

.method stateIsDo(I)Z
    .locals 1

    .line 199
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget p1, v0, p1

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method stateIsDont(I)Z
    .locals 0

    .line 211
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsDo(I)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method stateIsWill(I)Z
    .locals 1

    .line 175
    iget-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->options:[I

    aget p1, v0, p1

    const/4 v0, 0x1

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method stateIsWont(I)Z
    .locals 0

    .line 187
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/telnet/Telnet;->stateIsWill(I)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public unregisterNotifHandler()V
    .locals 1

    const/4 v0, 0x0

    .line 1264
    iput-object v0, p0, Lorg/apache/commons/net/telnet/Telnet;->notifhand:Lorg/apache/commons/net/telnet/TelnetNotificationHandler;

    return-void
.end method
