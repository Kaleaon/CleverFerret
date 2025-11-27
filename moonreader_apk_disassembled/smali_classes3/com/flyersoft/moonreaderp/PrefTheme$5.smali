.class Lcom/flyersoft/moonreaderp/PrefTheme$5;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 543
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$5;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 546
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$5;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$5;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->follow_sys_dark:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p1, v0, v2, v1}, Lcom/flyersoft/moonreaderp/PrefShelf;-><init>(Landroid/content/Context;ZLjava/lang/String;)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->show()V

    return-void
.end method
