.class Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontSizeKeywords;
.super Ljava/lang/Object;
.source "SVGParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontSizeKeywords"
.end annotation


# static fields
.field private static final fontSizeKeywords:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 521
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontSizeKeywords;->fontSizeKeywords:Ljava/util/Map;

    .line 523
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v2, 0x3f31a9fc    # 0.694f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "xx-small"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v2, 0x3f553f7d    # 0.833f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "x-small"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v2, 0x41200000    # 10.0f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "small"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v2, 0x41400000    # 12.0f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "medium"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v2, 0x41666666    # 14.4f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "large"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v2, 0x418a6666    # 17.3f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "x-large"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v2, 0x41a5999a    # 20.7f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->pt:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "xx-large"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 530
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const v2, 0x42a6a8f6    # 83.33f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "smaller"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v2, 0x42f00000    # 120.0f

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    const-string v2, "larger"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 520
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static get(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 1

    .line 535
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$FontSizeKeywords;->fontSizeKeywords:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-object p0
.end method
