.class public final Lorg/apache/commons/net/smtp/SMTPCommand;
.super Ljava/lang/Object;
.source "SMTPCommand.java"


# static fields
.field public static final AUTH:I = 0xe

.field public static final DATA:I = 0x3

.field public static final EHLO:I = 0xf

.field public static final EXPAND:I = 0x9

.field public static final EXPN:I = 0x9

.field public static final HELLO:I = 0x0

.field public static final HELO:I = 0x0

.field public static final HELP:I = 0xa

.field public static final LOGIN:I = 0x0

.field public static final LOGOUT:I = 0xd

.field public static final MAIL:I = 0x1

.field public static final MAIL_FROM:I = 0x1

.field private static final NEXT:I = 0x10

.field public static final NOOP:I = 0xb

.field public static final QUIT:I = 0xd

.field public static final RCPT:I = 0x2

.field public static final RECIPIENT:I = 0x2

.field public static final RESET:I = 0x7

.field public static final RSET:I = 0x7

.field public static final SAML:I = 0x6

.field public static final SEND:I = 0x4

.field public static final SEND_AND_MAIL_FROM:I = 0x6

.field public static final SEND_FROM:I = 0x4

.field public static final SEND_MESSAGE_DATA:I = 0x3

.field public static final SEND_OR_MAIL_FROM:I = 0x5

.field public static final SOML:I = 0x5

.field public static final TURN:I = 0xc

.field public static final VERIFY:I = 0x8

.field public static final VRFY:I = 0x8

.field private static final commands:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 83
    const-string v15, "AUTH"

    const-string v16, "EHLO"

    const-string v1, "HELO"

    const-string v2, "MAIL FROM:"

    const-string v3, "RCPT TO:"

    const-string v4, "DATA"

    const-string v5, "SEND FROM:"

    const-string v6, "SOML FROM:"

    const-string v7, "SAML FROM:"

    const-string v8, "RSET"

    const-string v9, "VRFY"

    const-string v10, "EXPN"

    const-string v11, "HELP"

    const-string v12, "NOOP"

    const-string v13, "TURN"

    const-string v14, "QUIT"

    filled-new-array/range {v1 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/smtp/SMTPCommand;->commands:[Ljava/lang/String;

    .line 91
    array-length v0, v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    return-void

    .line 92
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error in array definition"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private constructor <init>()V
    .locals 0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCommand(I)Ljava/lang/String;
    .locals 1

    .line 106
    sget-object v0, Lorg/apache/commons/net/smtp/SMTPCommand;->commands:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method
