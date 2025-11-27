.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;
.super Lcom/github/mikephil/charting/formatter/ValueFormatter;
.source "PrefYearStatistics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyXValueFormatter"
.end annotation


# instance fields
.field mFormat:Ljava/text/DecimalFormat;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 239
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p0}, Lcom/github/mikephil/charting/formatter/ValueFormatter;-><init>()V

    .line 240
    new-instance p1, Ljava/text/DecimalFormat;

    const-string v0, "#"

    invoke-direct {p1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;->mFormat:Ljava/text/DecimalFormat;

    return-void
.end method


# virtual methods
.method public getFormattedValue(F)Ljava/lang/String;
    .locals 3

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;->mFormat:Ljava/text/DecimalFormat;

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
