.class Lcom/flyersoft/moonreaderp/PrefOptions$1;
.super Ljava/lang/Object;
.source "PrefOptions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefOptions;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$1;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 83
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$1;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->cancel()V

    return-void
.end method
