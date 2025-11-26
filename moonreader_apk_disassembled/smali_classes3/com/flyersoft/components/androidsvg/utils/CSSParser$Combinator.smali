.class final enum Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;
.super Ljava/lang/Enum;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Combinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

.field public static final enum CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

.field public static final enum DESCENDANT:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

.field public static final enum FOLLOWS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;
    .locals 3

    const/4 v0, 0x3

    .line 75
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->DESCENDANT:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->FOLLOWS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 77
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const-string v1, "DESCENDANT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->DESCENDANT:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    .line 78
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const-string v1, "CHILD"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    .line 79
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    const-string v1, "FOLLOWS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->FOLLOWS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    .line 75
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->$values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

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

    .line 75
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 75
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;
    .locals 1

    .line 75
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    return-object v0
.end method
