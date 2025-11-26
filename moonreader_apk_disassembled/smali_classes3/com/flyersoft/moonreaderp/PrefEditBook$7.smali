.class Lcom/flyersoft/moonreaderp/PrefEditBook$7;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 424
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$7;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public save(Ljava/lang/String;)V
    .locals 1

    .line 426
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$7;->this$0:Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsEt:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
