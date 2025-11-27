.class public final enum Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;
.super Ljava/lang/Enum;
.source "PasswordStrengthPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

.field public static final enum MINIMAL_REQUIREMENTS:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

.field public static final enum MODERATE_PASSWORD:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

.field public static final enum STRONG_PASSWORD:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    const-string v1, "MINIMAL_REQUIREMENTS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->MINIMAL_REQUIREMENTS:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    const-string v3, "MODERATE_PASSWORD"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->MODERATE_PASSWORD:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    .line 32
    new-instance v3, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    const-string v5, "STRONG_PASSWORD"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->STRONG_PASSWORD:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    .line 40
    new-instance v5, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->OTHER:Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    const/4 v7, 0x4

    .line 19
    new-array v7, v7, [Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->$VALUES:[Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->$VALUES:[Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teampolicies/PasswordStrengthPolicy;

    return-object v0
.end method
