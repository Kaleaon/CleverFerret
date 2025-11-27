.class public final enum Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;
.super Ljava/lang/Enum;
.source "UploadSessionAppendError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/UploadSessionAppendError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field public static final enum TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v1, "NOT_FOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 43
    new-instance v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v3, "INCORRECT_OFFSET"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 48
    new-instance v3, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v5, "CLOSED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 53
    new-instance v5, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v7, "NOT_CLOSED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 58
    new-instance v7, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v9, "TOO_LARGE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 63
    new-instance v9, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v11, "CONCURRENT_SESSION_INVALID_OFFSET"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 68
    new-instance v11, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v13, "CONCURRENT_SESSION_INVALID_DATA_SIZE"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 72
    new-instance v13, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const-string v15, "PAYLOAD_TOO_LARGE"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 81
    new-instance v15, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const/16 v17, 0x7

    const-string v2, "OTHER"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 86
    new-instance v2, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const/16 v19, 0x8

    const-string v4, "CONTENT_HASH_MISMATCH"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    const/16 v4, 0xa

    .line 31
    new-array v4, v4, [Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    aput-object v0, v4, v16

    aput-object v1, v4, v18

    aput-object v3, v4, v20

    aput-object v5, v4, v8

    aput-object v7, v4, v10

    aput-object v9, v4, v12

    aput-object v11, v4, v14

    aput-object v13, v4, v17

    aput-object v15, v4, v19

    aput-object v2, v4, v6

    sput-object v4, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;
    .locals 1

    .line 31
    const-class v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;
    .locals 1

    .line 31
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    return-object v0
.end method
