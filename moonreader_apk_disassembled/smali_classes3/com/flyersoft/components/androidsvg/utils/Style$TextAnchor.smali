.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TextAnchor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

.field public static final enum End:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

.field public static final enum Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

.field public static final enum Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;
    .locals 3

    const/4 v0, 0x3

    .line 207
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->End:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 209
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const-string v1, "Start"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Start:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    .line 210
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const-string v1, "Middle"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->Middle:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    .line 211
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    const-string v1, "End"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->End:Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    .line 207
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

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

    .line 207
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 207
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;
    .locals 1

    .line 207
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$TextAnchor;

    return-object v0
.end method
