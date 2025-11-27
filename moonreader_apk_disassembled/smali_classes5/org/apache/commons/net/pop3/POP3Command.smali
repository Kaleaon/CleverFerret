.class public final Lorg/apache/commons/net/pop3/POP3Command;
.super Ljava/lang/Object;
.source "POP3Command.java"


# static fields
.field public static final APOP:I = 0x9

.field public static final AUTH:I = 0xd

.field public static final CAPA:I = 0xc

.field public static final DELE:I = 0x6

.field public static final LIST:I = 0x4

.field private static final NEXT:I = 0xe

.field public static final NOOP:I = 0x7

.field public static final PASS:I = 0x1

.field public static final QUIT:I = 0x2

.field public static final RETR:I = 0x5

.field public static final RSET:I = 0x8

.field public static final STAT:I = 0x3

.field public static final TOP:I = 0xa

.field public static final UIDL:I = 0xb

.field public static final USER:I

.field static final commands:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 65
    const-string v12, "CAPA"

    const-string v13, "AUTH"

    const-string v0, "USER"

    const-string v1, "PASS"

    const-string v2, "QUIT"

    const-string v3, "STAT"

    const-string v4, "LIST"

    const-string v5, "RETR"

    const-string v6, "DELE"

    const-string v7, "NOOP"

    const-string v8, "RSET"

    const-string v9, "APOP"

    const-string v10, "TOP"

    const-string v11, "UIDL"

    filled-new-array/range {v0 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/pop3/POP3Command;->commands:[Ljava/lang/String;

    .line 71
    array-length v0, v0

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    return-void

    .line 72
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Error in array definition"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private constructor <init>()V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCommand(I)Ljava/lang/String;
    .locals 1

    .line 88
    sget-object v0, Lorg/apache/commons/net/pop3/POP3Command;->commands:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method
