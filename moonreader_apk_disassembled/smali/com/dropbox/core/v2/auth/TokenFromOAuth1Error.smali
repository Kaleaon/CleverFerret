.class public final enum Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;
.super Ljava/lang/Enum;
.source "TokenFromOAuth1Error.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

.field public static final enum APP_ID_MISMATCH:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

.field public static final enum INVALID_OAUTH1_TOKEN_INFO:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

.field public static final enum OTHER:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    const-string v1, "INVALID_OAUTH1_TOKEN_INFO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->INVALID_OAUTH1_TOKEN_INFO:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    .line 29
    new-instance v1, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    const-string v3, "APP_ID_MISMATCH"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->APP_ID_MISMATCH:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    .line 37
    new-instance v3, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->OTHER:Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->$VALUES:[Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->$VALUES:[Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/auth/TokenFromOAuth1Error;

    return-object v0
.end method
