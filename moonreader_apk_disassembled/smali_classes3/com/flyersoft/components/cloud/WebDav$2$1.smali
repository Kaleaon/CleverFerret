.class Lcom/flyersoft/components/cloud/WebDav$2$1;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/cloud/WebDav$2;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 121
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$2$1;->this$1:Lcom/flyersoft/components/cloud/WebDav$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 124
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$2$1;->this$1:Lcom/flyersoft/components/cloud/WebDav$2;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/WebDav$2;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/WebDav;->unlink()V

    return-void
.end method
