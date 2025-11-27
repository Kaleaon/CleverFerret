.class Lcom/flyersoft/moonreaderp/PrefEditBook$11;
.super Ljava/lang/Object;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditBook;->selectTagName(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$checked:[Z

.field final synthetic val$onTagsPick:Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;

.field final synthetic val$tags:[Ljava/lang/String;


# direct methods
.method constructor <init>([Z[Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 523
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$11;->val$checked:[Z

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$11;->val$tags:[Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$11;->val$onTagsPick:Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 527
    const-string p1, ""

    const/4 p2, 0x0

    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$11;->val$checked:[Z

    array-length v1, v0

    if-ge p2, v1, :cond_1

    .line 528
    aget-boolean v0, v0, p2

    if-eqz v0, :cond_0

    .line 529
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$11;->val$tags:[Ljava/lang/String;

    aget-object p1, p1, p2

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 530
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook$11;->val$onTagsPick:Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;

    if-eqz p2, :cond_2

    .line 531
    invoke-interface {p2, p1}, Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;->save(Ljava/lang/String;)V

    :cond_2
    return-void
.end method
