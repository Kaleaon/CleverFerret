.class public final enum Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;
.super Ljava/lang/Enum;
.source "CountFileRequestsError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/filerequests/CountFileRequestsError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

.field public static final enum DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 26
    new-instance v0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    const-string v1, "DISABLED_FOR_TEAM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;->DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    .line 34
    new-instance v1, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;->OTHER:Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    const/4 v3, 0x2

    .line 21
    new-array v3, v3, [Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;->$VALUES:[Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;
    .locals 1

    .line 21
    const-class v0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;
    .locals 1

    .line 21
    sget-object v0, Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;->$VALUES:[Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/filerequests/CountFileRequestsError;

    return-object v0
.end method
