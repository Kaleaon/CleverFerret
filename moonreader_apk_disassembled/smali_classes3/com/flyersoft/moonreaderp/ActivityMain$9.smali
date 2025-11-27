.class Lcom/flyersoft/moonreaderp/ActivityMain$9;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initMainPager()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1061
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$9;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1063
    rem-int/lit8 p1, p1, 0x5

    .line 1064
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPageSelected:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", lastTab:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->lastTab:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1065
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    if-eq v0, p1, :cond_0

    .line 1069
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$9;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateTab(Lcom/flyersoft/moonreaderp/ActivityMain;IZ)V

    .line 1073
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$9;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBoard:Z

    iput-boolean v2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashBookmarks:Z

    iput-boolean v2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashLib:Z

    iput-boolean v2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fromDashFiles:Z

    return-void
.end method
