.class public final Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;
.super Ljava/lang/Object;
.source "DeleteManualContactsError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;,
        Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

.field private contactsNotFoundValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->OTHER:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->withTag(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->OTHER:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;)Ljava/util/List;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFoundValue:Ljava/util/List;

    return-object p0
.end method

.method public static contactsNotFound(Ljava/util/List;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;"
        }
    .end annotation

    if-eqz p0, :cond_4

    .line 148
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 152
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xff

    if-gt v2, v3, :cond_1

    .line 155
    const-string v2, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v2, v1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 156
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 153
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 150
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 159
    :cond_3
    new-instance v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->CONTACTS_NOT_FOUND:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->withTagAndContactsNotFound(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    move-result-object p0

    return-object p0

    .line 146
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;
    .locals 1

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;-><init>()V

    .line 78
    iput-object p1, v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    return-object v0
.end method

.method private withTagAndContactsNotFound(Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;"
        }
    .end annotation

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;-><init>()V

    .line 95
    iput-object p1, v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    .line 96
    iput-object p2, v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFoundValue:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 209
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    if-eqz v2, :cond_7

    .line 210
    check-cast p1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;

    .line 211
    iget-object v2, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 214
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$1;->$SwitchMap$com$dropbox$core$v2$contacts$DeleteManualContactsError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 216
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFoundValue:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFoundValue:Ljava/util/List;

    if-eq v2, p1, :cond_6

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getContactsNotFoundValue()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->CONTACTS_NOT_FOUND:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    if-ne v0, v1, :cond_0

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFoundValue:Ljava/util/List;

    return-object v0

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CONTACTS_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->contactsNotFoundValue:Ljava/util/List;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isContactsNotFound()Z
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->CONTACTS_NOT_FOUND:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;->OTHER:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError;->_tag:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 230
    sget-object v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 242
    sget-object v0, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/contacts/DeleteManualContactsError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
