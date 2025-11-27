.class Lcom/flyersoft/moonreaderp/ActivityTxt$42;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$flip_animation:I

.field final synthetic val$hori_fling:I

.field final synthetic val$hyphenationLang:Ljava/lang/String;

.field final synthetic val$italic:Z

.field final synthetic val$useCssFont:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ZIIZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3300
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$italic:Z

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$flip_animation:I

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$hori_fling:I

    iput-boolean p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$useCssFont:Z

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$hyphenationLang:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 3302
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, 0x320

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreScrollToTopBug(I)V

    const/4 p1, 0x1

    .line 3303
    invoke-static {p1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 3304
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$italic:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eq p1, v0, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->textJustified:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-eqz p1, :cond_0

    .line 3305
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3307
    :cond_0
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$flip_animation:I

    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    if-eq p1, v0, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipCurl()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 3308
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    iget p1, p1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D;->getStyle()I

    move-result v0

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 3312
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curl3d:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D;->clearAllShots()V

    goto :goto_1

    .line 3309
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3315
    :cond_3
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isHoriFlipCurl()Z

    move-result p1

    if-eqz p1, :cond_4

    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$hori_fling:I

    sget v0, Lcom/flyersoft/tools/A;->hori_fling_animation:I

    if-eq p1, v0, :cond_4

    sget p1, Lcom/flyersoft/tools/A;->flip_animation:I

    if-nez p1, :cond_4

    .line 3316
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3319
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    const/16 v0, 0x64

    if-ne p1, v0, :cond_6

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$useCssFont:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-ne p1, v0, :cond_5

    sget-boolean p1, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz p1, :cond_6

    sget-boolean p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->epubIgnoreFontChanged:Z

    if-eqz p1, :cond_6

    :cond_5
    const/4 p1, 0x0

    .line 3322
    sput-boolean p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->epubIgnoreFontChanged:Z

    .line 3323
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 3327
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez p1, :cond_7

    .line 3328
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckStatusBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_2

    .line 3330
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadWebView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3331
    :goto_2
    sget-boolean p1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->val$hyphenationLang:Ljava/lang/String;

    sget-object v0, Lcom/flyersoft/tools/A;->hyphenationLang:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 3332
    invoke-static {}, Lcom/flyersoft/tools/A;->setHyphenation()V

    .line 3333
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void

    .line 3335
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$42;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->resetFlipCache()V

    return-void
.end method
