.class public final enum Lcom/github/junrar/exception/RarException$RarExceptionType;
.super Ljava/lang/Enum;
.source "RarException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/junrar/exception/RarException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RarExceptionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/github/junrar/exception/RarException$RarExceptionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum crcError:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum headerNotInArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum ioError:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum mainHeaderNull:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum notImplementedYet:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum notRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum rarEncryptedException:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum unkownError:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum unsupportedRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

.field public static final enum wrongHeaderType:Lcom/github/junrar/exception/RarException$RarExceptionType;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 54
    new-instance v0, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v1, "notImplementedYet"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/junrar/exception/RarException$RarExceptionType;->notImplementedYet:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 55
    new-instance v1, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v3, "crcError"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/github/junrar/exception/RarException$RarExceptionType;->crcError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 56
    new-instance v3, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v5, "notRarArchive"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/github/junrar/exception/RarException$RarExceptionType;->notRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 57
    new-instance v5, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v7, "badRarArchive"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/github/junrar/exception/RarException$RarExceptionType;->badRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 58
    new-instance v7, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v9, "unkownError"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/github/junrar/exception/RarException$RarExceptionType;->unkownError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 59
    new-instance v9, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v11, "headerNotInArchive"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/github/junrar/exception/RarException$RarExceptionType;->headerNotInArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 60
    new-instance v11, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v13, "wrongHeaderType"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/github/junrar/exception/RarException$RarExceptionType;->wrongHeaderType:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 61
    new-instance v13, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const-string v15, "ioError"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/github/junrar/exception/RarException$RarExceptionType;->ioError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 62
    new-instance v15, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const/16 v17, 0x7

    const-string v2, "rarEncryptedException"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/github/junrar/exception/RarException$RarExceptionType;->rarEncryptedException:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 63
    new-instance v2, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const/16 v19, 0x8

    const-string v4, "mainHeaderNull"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/github/junrar/exception/RarException$RarExceptionType;->mainHeaderNull:Lcom/github/junrar/exception/RarException$RarExceptionType;

    .line 64
    new-instance v4, Lcom/github/junrar/exception/RarException$RarExceptionType;

    const/16 v21, 0x9

    const-string v6, "unsupportedRarArchive"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/github/junrar/exception/RarException$RarExceptionType;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/github/junrar/exception/RarException$RarExceptionType;->unsupportedRarArchive:Lcom/github/junrar/exception/RarException$RarExceptionType;

    const/16 v6, 0xb

    .line 53
    new-array v6, v6, [Lcom/github/junrar/exception/RarException$RarExceptionType;

    aput-object v0, v6, v16

    aput-object v1, v6, v18

    aput-object v3, v6, v20

    aput-object v5, v6, v22

    aput-object v7, v6, v10

    aput-object v9, v6, v12

    aput-object v11, v6, v14

    aput-object v13, v6, v17

    aput-object v15, v6, v19

    aput-object v2, v6, v21

    aput-object v4, v6, v8

    sput-object v6, Lcom/github/junrar/exception/RarException$RarExceptionType;->$VALUES:[Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 53
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/junrar/exception/RarException$RarExceptionType;
    .locals 1

    .line 53
    const-class v0, Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-object p0
.end method

.method public static values()[Lcom/github/junrar/exception/RarException$RarExceptionType;
    .locals 1

    .line 53
    sget-object v0, Lcom/github/junrar/exception/RarException$RarExceptionType;->$VALUES:[Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-virtual {v0}, [Lcom/github/junrar/exception/RarException$RarExceptionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-object v0
.end method
