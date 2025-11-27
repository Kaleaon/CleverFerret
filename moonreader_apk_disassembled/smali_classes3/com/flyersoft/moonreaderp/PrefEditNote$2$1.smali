.class Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;
.super Ljava/lang/Object;
.source "PrefEditNote.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefEditNote$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefEditNote$2;

.field final synthetic val$adapter:Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditNote$2;Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;)V
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

    .line 162
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefEditNote$2;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->val$adapter:Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onItemClick$0$com-flyersoft-moonreaderp-PrefEditNote$2$1(Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 171
    sput-object p3, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 173
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/note_img.png"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x1

    invoke-static {p2, p3, v0}, Lcom/flyersoft/tools/T;->copyFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 174
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;->notifyDataSetChanged()V

    .line 175
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefEditNote$2;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->-$$Nest$mupdateMRNoteImage(Lcom/flyersoft/moonreaderp/PrefEditNote$2;)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 165
    sput p3, Lcom/flyersoft/tools/A;->noteImg:I

    .line 166
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefEditNote$2;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->-$$Nest$mupdateMRNoteImage(Lcom/flyersoft/moonreaderp/PrefEditNote$2;)V

    const/4 p2, 0x3

    if-ne p3, p2, :cond_0

    .line 168
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 169
    sget-object p1, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-static {v3, p1}, Lcom/flyersoft/tools/A;->addImagesFromOuterFolder(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 170
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->this$1:Lcom/flyersoft/moonreaderp/PrefEditNote$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefEditNote$2;->this$0:Lcom/flyersoft/moonreaderp/PrefEditNote;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefEditNote;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->val$adapter:Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;-><init>(Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;)V

    sget-object v5, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/high16 p1, 0x42b40000    # 90.0f

    .line 177
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    const/high16 p1, 0x428c0000    # 70.0f

    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->background_image:I

    .line 178
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v10}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->show()V

    :cond_0
    return-void
.end method
