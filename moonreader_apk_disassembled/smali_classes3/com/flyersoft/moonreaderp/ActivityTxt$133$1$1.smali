.class Lcom/flyersoft/moonreaderp/ActivityTxt$133$1$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13443
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 13446
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->deleteStatistics(Ljava/lang/String;)I

    .line 13447
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->statisticsTime:J

    .line 13448
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$133$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$133;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    return-void
.end method
