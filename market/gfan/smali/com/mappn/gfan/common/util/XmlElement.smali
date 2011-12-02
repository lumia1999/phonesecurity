.class public Lcom/mappn/gfan/common/util/XmlElement;
.super Ljava/lang/Object;


# static fields
.field private static final EQUEL:Ljava/lang/String; = "="

.field private static final QUOT:Ljava/lang/String; = "\""

.field private static final REPLACE:[Ljava/lang/String; = null

#the value of this static final field might be set in the static constructor
.field private static final REPLACE_LENGTH:I = 0x0

.field private static final SPACE:Ljava/lang/String; = " "

.field private static final TAG_END:Ljava/lang/String; = "/"

.field private static final TAG_LEFT:Ljava/lang/String; = "<"

.field private static final TAG_RIGHT:Ljava/lang/String; = ">"


# instance fields
.field private all:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private children:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ">;>;"
        }
    .end annotation
.end field

.field private childrenList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private text:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "&"

    aput-object v2, v0, v1

    const-string v1, "&amp;"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "\""

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "&quot;"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "\'"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "&apos;"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "<"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "&lt;"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, ">"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "&gt;"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE:[Ljava/lang/String;

    sget-object v0, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE:[Ljava/lang/String;

    array-length v0, v0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    sget-object v0, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE:[Ljava/lang/String;

    array-length v0, v0

    :goto_0
    sput v0, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE_LENGTH:I

    return-void

    :cond_0
    sget-object v0, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE:[Ljava/lang/String;

    array-length v0, v0

    sub-int/2addr v0, v3

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->text:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->children:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->childrenList:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    return-void
.end method

.method private addAttributes(Ljava/io/Writer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    const-string v1, " "

    invoke-virtual {p1, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v3, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v1

    const-string v3, "="

    invoke-virtual {v1, v3}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v1

    const-string v3, "\""

    invoke-virtual {v1, v3}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/mappn/gfan/common/util/XmlElement;->addText(Ljava/io/Writer;Ljava/lang/String;)V

    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private addTag(Ljava/io/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/XmlElement;->addAttributes(Ljava/io/Writer;)V

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    return-void
.end method

.method private addTagEnd(Ljava/io/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    return-void
.end method

.method private addTagStart(Ljava/io/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v0

    iget-object v1, p0, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    invoke-direct {p0, p1}, Lcom/mappn/gfan/common/util/XmlElement;->addAttributes(Ljava/io/Writer;)V

    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    return-void
.end method

.method private addText(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p2, :cond_1

    const/4 v0, 0x0

    move-object v1, p2

    :goto_0
    sget v2, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE_LENGTH:I

    if-ge v0, v2, :cond_0

    sget-object v2, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Lcom/mappn/gfan/common/util/XmlElement;->REPLACE:[Ljava/lang/String;

    add-int/lit8 v4, v0, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    :cond_1
    return-void
.end method

.method private addXml(Ljava/io/Writer;Lcom/mappn/gfan/common/util/XmlElement;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p2, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p2, p1}, Lcom/mappn/gfan/common/util/XmlElement;->addTag(Ljava/io/Writer;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p2, p1}, Lcom/mappn/gfan/common/util/XmlElement;->addTagStart(Ljava/io/Writer;)V

    iget-object v0, p2, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1

    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_2

    check-cast p0, Ljava/lang/String;

    invoke-direct {p2, p1, p0}, Lcom/mappn/gfan/common/util/XmlElement;->addText(Ljava/io/Writer;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    invoke-direct {p2, p1, p0}, Lcom/mappn/gfan/common/util/XmlElement;->addXml(Ljava/io/Writer;Lcom/mappn/gfan/common/util/XmlElement;)V

    goto :goto_1

    :cond_3
    invoke-direct {p2, p1}, Lcom/mappn/gfan/common/util/XmlElement;->addTagEnd(Ljava/io/Writer;)V

    goto :goto_0
.end method

.method public static parseXml(Ljava/io/InputStream;)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v4, 0x1

    if-nez p0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    invoke-virtual {v0, v4}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-interface {v0, p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    :goto_1
    if-eq v1, v4, :cond_3

    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/util/XmlElement;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Lorg/xmlpull/v1/XmlPullParser;)V

    :goto_2
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    move v5, v2

    move-object v2, v1

    move v1, v5

    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    :try_start_0
    sget-object v3, Lorg/xmlpull/v1/XmlPullParser;->TYPES:[Ljava/lang/String;

    aget-object v1, v3, v1

    invoke-static {v1}, Lcom/mappn/gfan/common/util/Utils;->W(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    move-object v1, v2

    goto :goto_2

    :catch_0
    move-exception v1

    const-string v3, "Oh! My God!"

    invoke-static {v3, v1}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v2

    goto :goto_2

    :cond_3
    move-object v0, v2

    goto :goto_0
.end method

.method private parseXml(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/mappn/gfan/common/util/XmlElement;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    :goto_1
    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    new-instance v1, Lcom/mappn/gfan/common/util/XmlElement;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mappn/gfan/common/util/XmlElement;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/mappn/gfan/common/util/XmlElement;->addChild(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/util/XmlElement;

    invoke-direct {v1, p1}, Lcom/mappn/gfan/common/util/XmlElement;->parseXml(Lorg/xmlpull/v1/XmlPullParser;)V

    :cond_1
    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    :cond_2
    return-void

    :cond_3
    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/XmlElement;->addText(Ljava/lang/String;)Lcom/mappn/gfan/common/util/XmlElement;

    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_1
.end method


# virtual methods
.method public addAttributes(Ljava/util/Map;)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/mappn/gfan/common/util/XmlElement;"
        }
    .end annotation

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    return-object p0
.end method

.method public addChild(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 4

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->childrenList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->children:Ljava/util/Map;

    iget-object v1, p1, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->children:Ljava/util/Map;

    iget-object v1, p1, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->children:Ljava/util/Map;

    iget-object v1, p1, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object p0
.end method

.method public addChildren(Ljava/util/List;)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ">;)",
            "Lcom/mappn/gfan/common/util/XmlElement;"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mappn/gfan/common/util/XmlElement;

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/XmlElement;->addChild(Lcom/mappn/gfan/common/util/XmlElement;)Lcom/mappn/gfan/common/util/XmlElement;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public addText(Ljava/lang/String;)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->text:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public clear()Lcom/mappn/gfan/common/util/XmlElement;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->text:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->children:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->childrenList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-object p0
.end method

.method public getAllChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->childrenList:Ljava/util/List;

    return-object v0
.end method

.method public getAllText()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->text:Ljava/util/List;

    return-object v0
.end method

.method public getAllTextAndChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->all:Ljava/util/List;

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    return-object v0
.end method

.method public getChild(I)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->childrenList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, p1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->childrenList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChild(Ljava/lang/String;I)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/mappn/gfan/common/util/XmlElement;->getChildren(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, p2, :cond_0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/mappn/gfan/common/util/XmlElement;

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChildren(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mappn/gfan/common/util/XmlElement;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->children:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/XmlElement;->getText(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->text:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, p1, :cond_0

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->text:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    move-object v0, p0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/mappn/gfan/common/util/XmlElement;
    .locals 1

    iget-object v0, p0, Lcom/mappn/gfan/common/util/XmlElement;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/mappn/gfan/common/util/XmlElement;->writeAsXml(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v1

    const-string v2, "Oh! My God!"

    invoke-static {v2, v1}, Lcom/mappn/gfan/common/util/Utils;->E(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public writeAsXml(Ljava/io/Writer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1, p0}, Lcom/mappn/gfan/common/util/XmlElement;->addXml(Ljava/io/Writer;Lcom/mappn/gfan/common/util/XmlElement;)V

    return-void
.end method
