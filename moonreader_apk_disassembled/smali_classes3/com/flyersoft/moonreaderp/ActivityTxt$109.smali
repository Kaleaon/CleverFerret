.class Lcom/flyersoft/moonreaderp/ActivityTxt$109;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doSpeedRead()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11732
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onExit(ZJJJ)V
    .locals 4

    .line 11735
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->prefSpeed:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    const/4 v0, 0x1

    .line 11736
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 11737
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    sget-boolean v2, Lcom/flyersoft/tools/A;->keepScreenAwake:Z

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setKeepScreenOn(Z)V

    .line 11738
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "speed read close........"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz p1, :cond_2

    .line 11741
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 11743
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-nez p1, :cond_1

    .line 11744
    sget-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    add-long/2addr v2, p2

    sput-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 11745
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_0

    .line 11747
    :cond_1
    sput-wide p2, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 11748
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 11750
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    sub-long/2addr p2, p4

    iput-wide p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->statisticsTime:J

    .line 11751
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputread_words(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 11752
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    long-to-int p2, p6

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$maddStatisticsWords(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 11753
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$109;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveStatisticsInfo(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_2
    return-void
.end method
