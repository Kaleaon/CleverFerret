.class public final Lorg/apache/commons/net/ftp/FTPCommand;
.super Ljava/lang/Object;
.source "FTPCommand.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final ABOR:I = 0x15

.field public static final ABORT:I = 0x15

.field public static final ACCOUNT:I = 0x2

.field public static final ACCT:I = 0x2

.field public static final ALLO:I = 0x11

.field public static final ALLOCATE:I = 0x11

.field public static final APPE:I = 0x10

.field public static final APPEND:I = 0x10

.field public static final CDUP:I = 0x4

.field public static final CHANGE_TO_PARENT_DIRECTORY:I = 0x4

.field public static final CHANGE_WORKING_DIRECTORY:I = 0x3

.field public static final CWD:I = 0x3

.field public static final DATA_PORT:I = 0x8

.field public static final DELE:I = 0x16

.field public static final DELETE:I = 0x16

.field public static final EPRT:I = 0x25

.field public static final EPSV:I = 0x24

.field public static final FEAT:I = 0x22

.field public static final FEATURES:I = 0x22

.field public static final FILE_STRUCTURE:I = 0xb

.field public static final GET_MOD_TIME:I = 0x21

.field public static final HELP:I = 0x1f

.field private static final LAST:I = 0x27

.field public static final LIST:I = 0x1a

.field public static final LOGOUT:I = 0x7

.field public static final MAKE_DIRECTORY:I = 0x18

.field public static final MDTM:I = 0x21

.field public static final MFMT:I = 0x23

.field public static final MKD:I = 0x18

.field public static final MLSD:I = 0x26

.field public static final MLST:I = 0x27

.field public static final MODE:I = 0xc

.field public static final MOD_TIME:I = 0x21

.field public static final NAME_LIST:I = 0x1b

.field public static final NLST:I = 0x1b

.field public static final NOOP:I = 0x20

.field public static final PASS:I = 0x1

.field public static final PASSIVE:I = 0x9

.field public static final PASSWORD:I = 0x1

.field public static final PASV:I = 0x9

.field public static final PORT:I = 0x8

.field public static final PRINT_WORKING_DIRECTORY:I = 0x19

.field public static final PWD:I = 0x19

.field public static final QUIT:I = 0x7

.field public static final REIN:I = 0x6

.field public static final REINITIALIZE:I = 0x6

.field public static final REMOVE_DIRECTORY:I = 0x17

.field public static final RENAME_FROM:I = 0x13

.field public static final RENAME_TO:I = 0x14

.field public static final REPRESENTATION_TYPE:I = 0xa

.field public static final REST:I = 0x12

.field public static final RESTART:I = 0x12

.field public static final RETR:I = 0xd

.field public static final RETRIEVE:I = 0xd

.field public static final RMD:I = 0x17

.field public static final RNFR:I = 0x13

.field public static final RNTO:I = 0x14

.field public static final SET_MOD_TIME:I = 0x23

.field public static final SITE:I = 0x1c

.field public static final SITE_PARAMETERS:I = 0x1c

.field public static final SMNT:I = 0x5

.field public static final STAT:I = 0x1e

.field public static final STATUS:I = 0x1e

.field public static final STOR:I = 0xe

.field public static final STORE:I = 0xe

.field public static final STORE_UNIQUE:I = 0xf

.field public static final STOU:I = 0xf

.field public static final STRU:I = 0xb

.field public static final STRUCTURE_MOUNT:I = 0x5

.field public static final SYST:I = 0x1d

.field public static final SYSTEM:I = 0x1d

.field public static final TRANSFER_MODE:I = 0xc

.field public static final TYPE:I = 0xa

.field public static final USER:I

.field public static final USERNAME:I

.field private static final _commands:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 41

    .line 141
    const-string v39, "MLSD"

    const-string v40, "MLST"

    const-string v1, "USER"

    const-string v2, "PASS"

    const-string v3, "ACCT"

    const-string v4, "CWD"

    const-string v5, "CDUP"

    const-string v6, "SMNT"

    const-string v7, "REIN"

    const-string v8, "QUIT"

    const-string v9, "PORT"

    const-string v10, "PASV"

    const-string v11, "TYPE"

    const-string v12, "STRU"

    const-string v13, "MODE"

    const-string v14, "RETR"

    const-string v15, "STOR"

    const-string v16, "STOU"

    const-string v17, "APPE"

    const-string v18, "ALLO"

    const-string v19, "REST"

    const-string v20, "RNFR"

    const-string v21, "RNTO"

    const-string v22, "ABOR"

    const-string v23, "DELE"

    const-string v24, "RMD"

    const-string v25, "MKD"

    const-string v26, "PWD"

    const-string v27, "LIST"

    const-string v28, "NLST"

    const-string v29, "SITE"

    const-string v30, "SYST"

    const-string v31, "STAT"

    const-string v32, "HELP"

    const-string v33, "NOOP"

    const-string v34, "MDTM"

    const-string v35, "FEAT"

    const-string v36, "MFMT"

    const-string v37, "EPSV"

    const-string v38, "EPRT"

    filled-new-array/range {v1 .. v40}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/ftp/FTPCommand;->_commands:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkArray()V
    .locals 4

    .line 153
    sget-object v0, Lorg/apache/commons/net/ftp/FTPCommand;->_commands:[Ljava/lang/String;

    array-length v1, v0

    const/16 v2, 0x28

    if-ne v1, v2, :cond_0

    return-void

    .line 154
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Incorrect _commands array. Should have length 40 found "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v0, v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getCommand(I)Ljava/lang/String;
    .locals 1

    .line 169
    sget-object v0, Lorg/apache/commons/net/ftp/FTPCommand;->_commands:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method
