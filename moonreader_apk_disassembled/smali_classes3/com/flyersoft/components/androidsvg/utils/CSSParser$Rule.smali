.class public Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;
.super Ljava/lang/Object;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rule"
.end annotation


# instance fields
.field final selector:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

.field final source:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

.field final style:Lcom/flyersoft/components/androidsvg/utils/Style;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;Lcom/flyersoft/components/androidsvg/utils/Style;Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;)V
    .locals 0

    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->selector:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    .line 313
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    .line 314
    iput-object p3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->source:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 320
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->selector:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " {...} (src="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Rule;->source:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
