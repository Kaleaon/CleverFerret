.class Lcom/flyersoft/moonreaderp/PrefEditNote$2;
.super Ljava/lang/Object;
.source "PrefEditNote.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditNote;->setNoteImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;


# direct methods
.method static bridge synthetic -$$Nest$mupdateMRNoteImage(Lcom/flyersoft/moonreaderp/PrefEditNote$2;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->updateMRNoteImage()V

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditNote;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private updateMRNoteImage()V
    .locals 1

    .line 186
    invoke-static {}, Lcom/flyersoft/staticlayout/MRTextView;->clearNoteBitmap()V

    .line 187
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_0

    .line 188
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 189
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_1

    .line 190
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    :cond_1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 157
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->note_images:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 158
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->gallery1:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    .line 159
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefEditNote;Landroid/content/Context;)V

    .line 160
    invoke-virtual {v0, v1}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 161
    sget v2, Lcom/flyersoft/tools/A;->noteImg:I

    invoke-virtual {v0, v2}, Landroid/widget/Gallery;->setSelection(I)V

    .line 162
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;

    invoke-direct {v2, p0, v1}, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;-><init>(Lcom/flyersoft/moonreaderp/PrefEditNote$2;Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;)V

    invoke-virtual {v0, v2}, Landroid/widget/Gallery;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 182
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->background_image:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
