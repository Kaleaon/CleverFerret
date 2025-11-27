.class Lcom/flyersoft/moonreaderp/PrefShareText$2;
.super Ljava/lang/Object;
.source "PrefShareText.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;->createTemplate1(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

.field final synthetic val$mr:Lcom/flyersoft/staticlayout/MRTextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;Lcom/flyersoft/staticlayout/MRTextView;)V
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

    .line 175
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->val$mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 178
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 180
    :try_start_0
    new-instance v0, Landroid/text/SpannableString;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 181
    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v1

    .line 182
    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v3, v3, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    const-class v4, Ljava/lang/Object;

    invoke-interface {v1, v2, v3, v4}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    .line 183
    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    aget-object v6, v2, v5

    .line 184
    invoke-interface {v1, v6}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v7

    sget-object v8, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v8, v8, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    sub-int/2addr v7, v8

    .line 185
    invoke-interface {v1, v6}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v8

    sget-object v9, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v9, v9, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    sub-int/2addr v8, v9

    if-gez v7, :cond_0

    const/4 v7, 0x0

    .line 188
    :cond_0
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-le v8, v9, :cond_1

    .line 189
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    :cond_1
    const/16 v9, 0x21

    .line 190
    invoke-interface {v0, v6, v7, v8, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 192
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->val$mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 194
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 195
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->val$mr:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 198
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->val$mr:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$2;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateBitmaps(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    return-void
.end method
