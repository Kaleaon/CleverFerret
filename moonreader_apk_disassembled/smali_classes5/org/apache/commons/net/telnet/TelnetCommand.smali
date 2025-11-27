.class public final Lorg/apache/commons/net/telnet/TelnetCommand;
.super Ljava/lang/Object;
.source "TelnetCommand.java"


# static fields
.field public static final ABORT:I = 0xee

.field public static final AO:I = 0xf5

.field public static final AYT:I = 0xf6

.field public static final BREAK:I = 0xf3

.field public static final DM:I = 0xf2

.field public static final DO:I = 0xfd

.field public static final DONT:I = 0xfe

.field public static final EC:I = 0xf7

.field public static final EL:I = 0xf8

.field public static final EOF:I = 0xec

.field public static final EOR:I = 0xef

.field private static final FIRST_COMMAND:I = 0xff

.field public static final GA:I = 0xf9

.field public static final IAC:I = 0xff

.field public static final IP:I = 0xf4

.field private static final LAST_COMMAND:I = 0xec

.field public static final MAX_COMMAND_VALUE:I = 0xff

.field public static final NOP:I = 0xf1

.field public static final SB:I = 0xfa

.field public static final SE:I = 0xf0

.field public static final SUSP:I = 0xed

.field public static final SYNCH:I = 0xf2

.field public static final WILL:I = 0xfb

.field public static final WONT:I = 0xfc

.field private static final commandString:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 96
    const-string v19, "SUSP"

    const-string v20, "EOF"

    const-string v1, "IAC"

    const-string v2, "DONT"

    const-string v3, "DO"

    const-string v4, "WONT"

    const-string v5, "WILL"

    const-string v6, "SB"

    const-string v7, "GA"

    const-string v8, "EL"

    const-string v9, "EC"

    const-string v10, "AYT"

    const-string v11, "AO"

    const-string v12, "IP"

    const-string v13, "BRK"

    const-string v14, "DMARK"

    const-string v15, "NOP"

    const-string v16, "SE"

    const-string v17, "EOR"

    const-string v18, "ABORT"

    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/telnet/TelnetCommand;->commandString:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCommand(I)Ljava/lang/String;
    .locals 1

    .line 113
    sget-object v0, Lorg/apache/commons/net/telnet/TelnetCommand;->commandString:[Ljava/lang/String;

    rsub-int p0, p0, 0xff

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static isValidCommand(I)Z
    .locals 1

    const/16 v0, 0xff

    if-gt p0, v0, :cond_0

    const/16 v0, 0xec

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
