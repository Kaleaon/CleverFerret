.class public final enum Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
.super Ljava/lang/Enum;
.source "RolloutMethod.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teampolicies/RolloutMethod$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teampolicies/RolloutMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

.field public static final enum ADD_MEMBER_TO_EXCEPTIONS:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

.field public static final enum UNLINK_ALL:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

.field public static final enum UNLINK_MOST_INACTIVE:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    const-string v1, "UNLINK_ALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->UNLINK_ALL:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    const-string v3, "UNLINK_MOST_INACTIVE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->UNLINK_MOST_INACTIVE:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    .line 32
    new-instance v3, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    const-string v5, "ADD_MEMBER_TO_EXCEPTIONS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->ADD_MEMBER_TO_EXCEPTIONS:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->$VALUES:[Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->$VALUES:[Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    return-object v0
.end method
