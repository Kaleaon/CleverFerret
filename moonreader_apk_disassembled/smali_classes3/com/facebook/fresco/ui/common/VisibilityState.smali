.class public final enum Lcom/facebook/fresco/ui/common/VisibilityState;
.super Ljava/lang/Enum;
.source "VisibilityState.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/fresco/ui/common/VisibilityState$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/fresco/ui/common/VisibilityState;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\u0008\u0086\u0081\u0002\u0018\u0000 \u000b2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000bB\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/facebook/fresco/ui/common/VisibilityState;",
        "",
        "value",
        "",
        "<init>",
        "(Ljava/lang/String;II)V",
        "getValue",
        "()I",
        "UNKNOWN",
        "VISIBLE",
        "INVISIBLE",
        "Companion",
        "ui-common_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/facebook/fresco/ui/common/VisibilityState;

.field public static final Companion:Lcom/facebook/fresco/ui/common/VisibilityState$Companion;

.field public static final enum INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

.field public static final enum UNKNOWN:Lcom/facebook/fresco/ui/common/VisibilityState;

.field private static final VALUES:[Lcom/facebook/fresco/ui/common/VisibilityState;

.field public static final enum VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;


# instance fields
.field private final value:I


# direct methods
.method private static final synthetic $values()[Lcom/facebook/fresco/ui/common/VisibilityState;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/facebook/fresco/ui/common/VisibilityState;

    sget-object v1, Lcom/facebook/fresco/ui/common/VisibilityState;->UNKNOWN:Lcom/facebook/fresco/ui/common/VisibilityState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 11
    new-instance v0, Lcom/facebook/fresco/ui/common/VisibilityState;

    const/4 v1, 0x0

    const/4 v2, -0x1

    const-string v3, "UNKNOWN"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/fresco/ui/common/VisibilityState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->UNKNOWN:Lcom/facebook/fresco/ui/common/VisibilityState;

    .line 12
    new-instance v0, Lcom/facebook/fresco/ui/common/VisibilityState;

    const-string v1, "VISIBLE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/fresco/ui/common/VisibilityState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->VISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    .line 13
    new-instance v0, Lcom/facebook/fresco/ui/common/VisibilityState;

    const-string v1, "INVISIBLE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/fresco/ui/common/VisibilityState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->INVISIBLE:Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-static {}, Lcom/facebook/fresco/ui/common/VisibilityState;->$values()[Lcom/facebook/fresco/ui/common/VisibilityState;

    move-result-object v0

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->$VALUES:[Lcom/facebook/fresco/ui/common/VisibilityState;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->$ENTRIES:Lkotlin/enums/EnumEntries;

    new-instance v0, Lcom/facebook/fresco/ui/common/VisibilityState$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/fresco/ui/common/VisibilityState$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->Companion:Lcom/facebook/fresco/ui/common/VisibilityState$Companion;

    .line 16
    invoke-static {}, Lcom/facebook/fresco/ui/common/VisibilityState;->values()[Lcom/facebook/fresco/ui/common/VisibilityState;

    move-result-object v0

    sput-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->VALUES:[Lcom/facebook/fresco/ui/common/VisibilityState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/facebook/fresco/ui/common/VisibilityState;->value:I

    return-void
.end method

.method public static final synthetic access$getVALUES$cp()[Lcom/facebook/fresco/ui/common/VisibilityState;
    .locals 1

    .line 10
    sget-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->VALUES:[Lcom/facebook/fresco/ui/common/VisibilityState;

    return-object v0
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/facebook/fresco/ui/common/VisibilityState;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/fresco/ui/common/VisibilityState;
    .locals 1

    const-class v0, Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .line 20
    check-cast p0, Lcom/facebook/fresco/ui/common/VisibilityState;

    return-object p0
.end method

.method public static values()[Lcom/facebook/fresco/ui/common/VisibilityState;
    .locals 1

    sget-object v0, Lcom/facebook/fresco/ui/common/VisibilityState;->$VALUES:[Lcom/facebook/fresco/ui/common/VisibilityState;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 20
    check-cast v0, [Lcom/facebook/fresco/ui/common/VisibilityState;

    return-object v0
.end method


# virtual methods
.method public final getValue()I
    .locals 1

    .line 10
    iget v0, p0, Lcom/facebook/fresco/ui/common/VisibilityState;->value:I

    return v0
.end method
