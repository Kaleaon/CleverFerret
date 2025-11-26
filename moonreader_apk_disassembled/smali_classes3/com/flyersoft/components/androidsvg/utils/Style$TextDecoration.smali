.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TextDecoration"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

.field public static final enum Blink:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

.field public static final enum LineThrough:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

.field public static final enum None:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

.field public static final enum Overline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

.field public static final enum Underline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;
    .locals 3

    const/4 v0, 0x5

    .line 214
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->None:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Underline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Overline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->LineThrough:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Blink:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 216
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->None:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 217
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const-string v1, "Underline"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Underline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 218
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const-string v1, "Overline"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Overline:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 219
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const-string v1, "LineThrough"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->LineThrough:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 220
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    const-string v1, "Blink"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->Blink:Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    .line 214
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 214
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 214
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;
    .locals 1

    .line 214
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$TextDecoration;

    return-object v0
.end method
