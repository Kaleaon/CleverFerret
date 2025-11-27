.class public final Lorg/apache/commons/net/nntp/NNTPCommand;
.super Ljava/lang/Object;
.source "NNTPCommand.java"


# static fields
.field public static final ARTICLE:I = 0x0

.field public static final AUTHINFO:I = 0xf

.field public static final BODY:I = 0x1

.field public static final GROUP:I = 0x2

.field public static final HEAD:I = 0x3

.field public static final HELP:I = 0x4

.field public static final IHAVE:I = 0x5

.field public static final LAST:I = 0x6

.field public static final LIST:I = 0x7

.field public static final NEWGROUPS:I = 0x8

.field public static final NEWNEWS:I = 0x9

.field public static final NEXT:I = 0xa

.field public static final POST:I = 0xb

.field public static final QUIT:I = 0xc

.field public static final SLAVE:I = 0xd

.field public static final STAT:I = 0xe

.field public static final XHDR:I = 0x11

.field public static final XOVER:I = 0x10

.field private static final commands:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 51
    const-string v17, "XOVER"

    const-string v18, "XHDR"

    const-string v1, "ARTICLE"

    const-string v2, "BODY"

    const-string v3, "GROUP"

    const-string v4, "HEAD"

    const-string v5, "HELP"

    const-string v6, "IHAVE"

    const-string v7, "LAST"

    const-string v8, "LIST"

    const-string v9, "NEWGROUPS"

    const-string v10, "NEWNEWS"

    const-string v11, "NEXT"

    const-string v12, "POST"

    const-string v13, "QUIT"

    const-string v14, "SLAVE"

    const-string v15, "STAT"

    const-string v16, "AUTHINFO"

    filled-new-array/range {v1 .. v18}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/nntp/NNTPCommand;->commands:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCommand(I)Ljava/lang/String;
    .locals 1

    .line 68
    sget-object v0, Lorg/apache/commons/net/nntp/NNTPCommand;->commands:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method
