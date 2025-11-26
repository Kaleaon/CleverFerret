.class Lcom/flyersoft/components/WidgetOptionActivity$1;
.super Ljava/lang/Object;
.source "WidgetOptionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/WidgetOptionActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/WidgetOptionActivity;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/WidgetOptionActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 153
    iput-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$1;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 155
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$1;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    iget-boolean p1, p1, Lcom/flyersoft/components/WidgetOptionActivity;->fromStartConfig:Z

    if-eqz p1, :cond_0

    .line 156
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$1;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/WidgetOptionActivity;->setResult(I)V

    .line 157
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/WidgetOptionActivity$1;->this$0:Lcom/flyersoft/components/WidgetOptionActivity;

    invoke-virtual {p1}, Lcom/flyersoft/components/WidgetOptionActivity;->finish()V

    return-void
.end method
