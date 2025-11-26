.class public final synthetic Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# instance fields
.field public final synthetic f$0:Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;

.field public final synthetic f$1:Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;->f$0:Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;->f$1:Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;

    return-void
.end method


# virtual methods
.method public final onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;->f$0:Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1$$ExternalSyntheticLambda0;->f$1:Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;

    invoke-virtual {v0, v1, p1, p2}, Lcom/flyersoft/moonreaderp/PrefEditNote$2$1;->lambda$onItemClick$0$com-flyersoft-moonreaderp-PrefEditNote$2$1(Lcom/flyersoft/moonreaderp/PrefEditNote$GalleryAdapter;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
