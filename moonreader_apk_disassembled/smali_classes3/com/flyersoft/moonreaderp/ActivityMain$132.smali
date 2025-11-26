.class Lcom/flyersoft/moonreaderp/ActivityMain$132;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initStatisticsAnnotLv()V
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

    .line 12167
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$132;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 12169
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 12170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$132;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    .line 12172
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$132;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    .line 12174
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$132;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->doAnnotFilter()V

    return-void
.end method
