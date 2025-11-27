.class public final enum Lcom/facebook/infer/annotation/Nullsafe$Mode;
.super Ljava/lang/Enum;
.source "Nullsafe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/infer/annotation/Nullsafe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/infer/annotation/Nullsafe$Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/infer/annotation/Nullsafe$Mode;

.field public static final enum LOCAL:Lcom/facebook/infer/annotation/Nullsafe$Mode;

.field public static final enum STRICT:Lcom/facebook/infer/annotation/Nullsafe$Mode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 109
    new-instance v0, Lcom/facebook/infer/annotation/Nullsafe$Mode;

    const-string v1, "LOCAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/facebook/infer/annotation/Nullsafe$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/facebook/infer/annotation/Nullsafe$Mode;->LOCAL:Lcom/facebook/infer/annotation/Nullsafe$Mode;

    .line 110
    new-instance v1, Lcom/facebook/infer/annotation/Nullsafe$Mode;

    const-string v3, "STRICT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/facebook/infer/annotation/Nullsafe$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/facebook/infer/annotation/Nullsafe$Mode;->STRICT:Lcom/facebook/infer/annotation/Nullsafe$Mode;

    const/4 v3, 0x2

    .line 108
    new-array v3, v3, [Lcom/facebook/infer/annotation/Nullsafe$Mode;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/facebook/infer/annotation/Nullsafe$Mode;->$VALUES:[Lcom/facebook/infer/annotation/Nullsafe$Mode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 108
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/infer/annotation/Nullsafe$Mode;
    .locals 1

    .line 108
    const-class v0, Lcom/facebook/infer/annotation/Nullsafe$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/infer/annotation/Nullsafe$Mode;

    return-object p0
.end method

.method public static values()[Lcom/facebook/infer/annotation/Nullsafe$Mode;
    .locals 1

    .line 108
    sget-object v0, Lcom/facebook/infer/annotation/Nullsafe$Mode;->$VALUES:[Lcom/facebook/infer/annotation/Nullsafe$Mode;

    invoke-virtual {v0}, [Lcom/facebook/infer/annotation/Nullsafe$Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/infer/annotation/Nullsafe$Mode;

    return-object v0
.end method
