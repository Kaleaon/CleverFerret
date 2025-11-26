.class Lcom/flyersoft/moonreaderp/PrefTheme$7;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 585
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$7;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$7;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 588
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$7;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

    if-eqz p1, :cond_0

    .line 589
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$7;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$7;->val$name:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;->getTheme(Ljava/lang/String;)V

    .line 590
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$7;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->dismiss()V

    return-void
.end method
