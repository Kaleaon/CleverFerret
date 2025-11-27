.class public final enum Lorg/apache/commons/net/imap/IMAPCommand;
.super Ljava/lang/Enum;
.source "IMAPCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/net/imap/IMAPCommand;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum APPEND:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum AUTHENTICATE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum CAPABILITY:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum CHECK:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum CLOSE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum COPY:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum CREATE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum DELETE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum EXAMINE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum EXPUNGE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum FETCH:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum LIST:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum LOGIN:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum LOGOUT:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum LSUB:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum NOOP:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum RENAME:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum SEARCH:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum SELECT:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum STARTTLS:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum STATUS:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum STORE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum SUBSCRIBE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum UID:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum UNSUBSCRIBE:Lorg/apache/commons/net/imap/IMAPCommand;

.field public static final enum XOAUTH:Lorg/apache/commons/net/imap/IMAPCommand;


# instance fields
.field private final imapCommand:Ljava/lang/String;

.field private final maxParamCount:I

.field private final minParamCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 51

    .line 30
    new-instance v0, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v1, "CAPABILITY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->CAPABILITY:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 31
    new-instance v1, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v3, "NOOP"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v2}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPCommand;->NOOP:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 32
    new-instance v3, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v5, "LOGOUT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v2}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lorg/apache/commons/net/imap/IMAPCommand;->LOGOUT:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 35
    new-instance v5, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v7, "STARTTLS"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v2}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lorg/apache/commons/net/imap/IMAPCommand;->STARTTLS:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 36
    new-instance v7, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v9, "AUTHENTICATE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lorg/apache/commons/net/imap/IMAPCommand;->AUTHENTICATE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 37
    new-instance v9, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v11, "LOGIN"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v6}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lorg/apache/commons/net/imap/IMAPCommand;->LOGIN:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 39
    new-instance v11, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v13, "XOAUTH"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lorg/apache/commons/net/imap/IMAPCommand;->XOAUTH:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 42
    new-instance v13, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v15, "SELECT"

    const/16 v16, 0x5

    const/4 v12, 0x7

    invoke-direct {v13, v15, v12, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lorg/apache/commons/net/imap/IMAPCommand;->SELECT:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 43
    new-instance v15, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v17, 0x7

    const-string v12, "EXAMINE"

    const/16 v18, 0x6

    const/16 v14, 0x8

    invoke-direct {v15, v12, v14, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lorg/apache/commons/net/imap/IMAPCommand;->EXAMINE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 44
    new-instance v12, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v19, 0x8

    const-string v14, "CREATE"

    const/16 v8, 0x9

    invoke-direct {v12, v14, v8, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lorg/apache/commons/net/imap/IMAPCommand;->CREATE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 45
    new-instance v14, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v21, 0x9

    const-string v8, "DELETE"

    const/16 v2, 0xa

    invoke-direct {v14, v8, v2, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lorg/apache/commons/net/imap/IMAPCommand;->DELETE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 46
    new-instance v8, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v23, 0xa

    const-string v2, "RENAME"

    const/16 v10, 0xb

    invoke-direct {v8, v2, v10, v6}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lorg/apache/commons/net/imap/IMAPCommand;->RENAME:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 47
    new-instance v2, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v25, 0xb

    const-string v10, "SUBSCRIBE"

    const/16 v6, 0xc

    invoke-direct {v2, v10, v6, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPCommand;->SUBSCRIBE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 48
    new-instance v10, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v27, 0xc

    const-string v6, "UNSUBSCRIBE"

    move-object/from16 v28, v0

    const/16 v0, 0xd

    invoke-direct {v10, v6, v0, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lorg/apache/commons/net/imap/IMAPCommand;->UNSUBSCRIBE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 49
    new-instance v6, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v29, 0xd

    const-string v0, "LIST"

    const/16 v4, 0xe

    move-object/from16 v31, v1

    const/4 v1, 0x2

    invoke-direct {v6, v0, v4, v1}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lorg/apache/commons/net/imap/IMAPCommand;->LIST:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 50
    new-instance v0, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v32, 0xe

    const-string v4, "LSUB"

    move-object/from16 v33, v2

    const/16 v2, 0xf

    invoke-direct {v0, v4, v2, v1}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->LSUB:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 51
    new-instance v4, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v34, 0xf

    const-string v2, "STATUS"

    move-object/from16 v35, v0

    const/16 v0, 0x10

    invoke-direct {v4, v2, v0, v1}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lorg/apache/commons/net/imap/IMAPCommand;->STATUS:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 52
    new-instance v2, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v36, 0x10

    const-string v0, "APPEND"

    move-object/from16 v37, v3

    const/16 v3, 0x11

    move-object/from16 v38, v4

    const/4 v4, 0x4

    invoke-direct {v2, v0, v3, v1, v4}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;III)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPCommand;->APPEND:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 55
    new-instance v0, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v1, "CHECK"

    const/16 v4, 0x12

    const/4 v3, 0x0

    const/16 v39, 0x11

    invoke-direct {v0, v1, v4, v3}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->CHECK:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 56
    new-instance v1, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v40, 0x12

    const-string v4, "CLOSE"

    move-object/from16 v41, v0

    const/16 v0, 0x13

    invoke-direct {v1, v4, v0, v3}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPCommand;->CLOSE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 57
    new-instance v4, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v42, 0x13

    const-string v0, "EXPUNGE"

    move-object/from16 v43, v1

    const/16 v1, 0x14

    invoke-direct {v4, v0, v1, v3}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lorg/apache/commons/net/imap/IMAPCommand;->EXPUNGE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 58
    new-instance v0, Lorg/apache/commons/net/imap/IMAPCommand;

    const v3, 0x7fffffff

    const/16 v44, 0x14

    const-string v1, "SEARCH"

    move-object/from16 v45, v2

    const/16 v2, 0x15

    move-object/from16 v46, v4

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v4, v3}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->SEARCH:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 59
    new-instance v1, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v3, "FETCH"

    const/16 v4, 0x16

    const/4 v2, 0x2

    const/16 v47, 0x15

    invoke-direct {v1, v3, v4, v2}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPCommand;->FETCH:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 60
    new-instance v3, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v4, "STORE"

    const/16 v2, 0x17

    move-object/from16 v48, v0

    const/4 v0, 0x3

    invoke-direct {v3, v4, v2, v0}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lorg/apache/commons/net/imap/IMAPCommand;->STORE:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 61
    new-instance v0, Lorg/apache/commons/net/imap/IMAPCommand;

    const-string v2, "COPY"

    const/16 v4, 0x18

    move-object/from16 v49, v1

    const/4 v1, 0x2

    invoke-direct {v0, v2, v4, v1}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->COPY:Lorg/apache/commons/net/imap/IMAPCommand;

    .line 62
    new-instance v2, Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v4, 0x19

    move-object/from16 v26, v0

    const v0, 0x7fffffff

    move-object/from16 v50, v3

    const-string v3, "UID"

    invoke-direct {v2, v3, v4, v1, v0}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;III)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPCommand;->UID:Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v0, 0x1a

    .line 23
    new-array v0, v0, [Lorg/apache/commons/net/imap/IMAPCommand;

    const/16 v22, 0x0

    aput-object v28, v0, v22

    const/16 v30, 0x1

    aput-object v31, v0, v30

    aput-object v37, v0, v1

    const/16 v20, 0x3

    aput-object v5, v0, v20

    const/16 v24, 0x4

    aput-object v7, v0, v24

    aput-object v9, v0, v16

    aput-object v11, v0, v18

    aput-object v13, v0, v17

    aput-object v15, v0, v19

    aput-object v12, v0, v21

    aput-object v14, v0, v23

    aput-object v8, v0, v25

    aput-object v33, v0, v27

    aput-object v10, v0, v29

    aput-object v6, v0, v32

    aput-object v35, v0, v34

    aput-object v38, v0, v36

    aput-object v45, v0, v39

    aput-object v41, v0, v40

    aput-object v43, v0, v42

    aput-object v46, v0, v44

    aput-object v48, v0, v47

    const/16 v1, 0x16

    aput-object v49, v0, v1

    const/16 v1, 0x17

    aput-object v50, v0, v1

    const/16 v1, 0x18

    aput-object v26, v0, v1

    const/16 v1, 0x19

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->$VALUES:[Lorg/apache/commons/net/imap/IMAPCommand;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 73
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    const/4 v3, 0x0

    move v5, p3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    .line 81
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    .line 85
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 77
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    move v5, p4

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    .line 89
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/imap/IMAPCommand;-><init>(Ljava/lang/String;ILjava/lang/String;II)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 93
    iput-object p3, p0, Lorg/apache/commons/net/imap/IMAPCommand;->imapCommand:Ljava/lang/String;

    .line 94
    iput p4, p0, Lorg/apache/commons/net/imap/IMAPCommand;->minParamCount:I

    .line 95
    iput p5, p0, Lorg/apache/commons/net/imap/IMAPCommand;->maxParamCount:I

    return-void
.end method

.method public static final getCommand(Lorg/apache/commons/net/imap/IMAPCommand;)Ljava/lang/String;
    .locals 0

    .line 105
    invoke-virtual {p0}, Lorg/apache/commons/net/imap/IMAPCommand;->getIMAPCommand()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/net/imap/IMAPCommand;
    .locals 1

    .line 23
    const-class v0, Lorg/apache/commons/net/imap/IMAPCommand;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/net/imap/IMAPCommand;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/net/imap/IMAPCommand;
    .locals 1

    .line 23
    sget-object v0, Lorg/apache/commons/net/imap/IMAPCommand;->$VALUES:[Lorg/apache/commons/net/imap/IMAPCommand;

    invoke-virtual {v0}, [Lorg/apache/commons/net/imap/IMAPCommand;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/net/imap/IMAPCommand;

    return-object v0
.end method


# virtual methods
.method public getIMAPCommand()Ljava/lang/String;
    .locals 1

    .line 114
    iget-object v0, p0, Lorg/apache/commons/net/imap/IMAPCommand;->imapCommand:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/net/imap/IMAPCommand;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
